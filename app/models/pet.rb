class Pet < ActiveRecord::Base
  has_many :notes, as: :notable
  belongs_to :user
end
