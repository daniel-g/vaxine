# Este presenter utiliza un user y sus notas para representar algo en la vista
# Pudo perfectamente haber sido un decorator
# Depende de la percepción del que implementa
class UserPresenter
  attr_accessor :user

  def initialize(user)
    self.user = user
  end

  def email
    user.email
  end

  def notify_birthday
    user.created_at - 1.day
  end

  def notes
    user.notes
  end
end
