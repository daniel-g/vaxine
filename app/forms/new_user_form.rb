class NewUserForm
  include ActiveModel::Model
  include Virtus.model

  attribute :correo, String

  validates :correo, presence: true

  attr_accessor :user

  def save
    if valid?
      persist!
    else
      false
    end
  end

  def persist!
    self.user = User.new
    self.user.email = correo
    self.user.save!
  end
end
