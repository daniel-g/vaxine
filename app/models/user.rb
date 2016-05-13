class User < ActiveRecord::Base
  # Tiene muchas notes
  # pero se obtienen de buscar los atributos
  # notable_type = User, notable_id = id
  has_many :notes, as: :notable
end
