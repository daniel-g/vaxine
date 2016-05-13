# El nombre debe denotar lo que hace en la aplicación
# Podría simplemente llamarse UserForm. En nuestro caso prueba NewUserForm
class NewUserForm
  # Se incluye la habilidad de comportarse como un modelo
  # http://api.rubyonrails.org/classes/ActiveModel/Model.html
  include ActiveModel::Model
  # Se incluye la habilidad de tener atributos con un tipo definido
  # https://github.com/solnic/virtus
  include Virtus.model
  # Se incluyen las rutas de rails
  # para poder utilizarlos en NewUserForm#action
  include Rails.application.routes.url_helpers

  # Estos atributo representan la interfaz con la forma en la vista
  # No necesariamente la representación en la base de datos
  attribute :correo, String
  attribute :type, String

  # Las validaciones forman parte de ActiveModel::Model
  validates :correo, presence: true

  attr_accessor :user

  # Sobreescribimos la inicialización para poder recibir un posible user
  # y de esa manera inicializar con sus atributos la forma
  def initialize(attrs = {}, user: nil)
    # Utilizamos el accessor para representar al user en nuestra base de datos
    self.user = user || User.new
    # Inicializamos la forma con los atributos del user
    self.correo = user.email
    self.type = user.type.downcase
    # Se manda llamar la inicialización de Virtus.model
    # de modo que
    # form = NewUserForm.new({correo: 'a@mail.com'}, user: User.new(email: 'b@mail.com'))
    # form.correo => 'a@mail.com'
    super(attrs)
  end

  # Guarda la información de la forma siempre que la forma sea válida
  def save
    if valid?
      persist!
    else
      false
    end
  end

  # atributo method en la forma
  # PUT si no es un objeto nuevo
  def method
    return :put if user.persisted?
    :post
  end

  # atributo action en la forma
  # /users/:id si no es un objeto nuevo
  def action
    return user_path(user) if user.persisted?
    users_path
  end

  # Se podría persitir en MySQL, Redis, MongoDB
  # La elección de persistencia será de la implementación
  # Dejando así la tarea de validar al Form Object
  def persist!
    self.user.email = correo
    if type == 'veterinarian'
      user.becomes!(Veterinarian)
    elsif type == 'client'
      user.becomes!(Client)
    end
    self.user.save!
  end
end
