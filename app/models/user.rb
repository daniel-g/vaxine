class User < ActiveRecord::Base
  has_many :notes, as: :notable
end
