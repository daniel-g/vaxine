class NewUserForm
  include ActiveModel::Model
  include Virtus.model
  include Rails.application.routes.url_helpers

  attribute :correo, String
  attribute :type, String

  validates :correo, presence: true

  attr_accessor :user

  def initialize(attrs = {}, user: nil)
    self.user = user || User.new
    self.correo = user.email
    self.type = user.type.downcase
    super(attrs)
  end

  def save
    if valid?
      persist!
    else
      false
    end
  end

  def method
    return :put if user.persisted?
    :post
  end

  def action
    return user_path(user) if user.persisted?
    users_path
  end

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
