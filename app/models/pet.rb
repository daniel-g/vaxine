class Pet < ActiveRecord::Base
  has_many :notes, as: :notable
end
