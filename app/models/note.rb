class Note < ActiveRecord::Base
  # notable puede ser cualquier modelo
  # en nuestro caso Pet y User, por ejemplo
  belongs_to :notable, polymorphic: true
end
