class Pet < ActiveRecord::Base
  # Tiene muchas notes
  # pero se obtienen de buscar los atributos
  # notable_type = Pet, notable_id = id
  has_many :notes, as: :notable
  belongs_to :user
end
