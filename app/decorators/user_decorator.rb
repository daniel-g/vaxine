class UserDecorator
  attr_accessor :user

  def initialize(user)
    self.user = user
  end

  def email
    user.email.upcase
  end

  def notify_birthday
    user.created_at - 1.day
  end
end
