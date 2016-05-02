class CreatePetVaccines < ActiveRecord::Migration
  def change
    create_table :pet_vaccines do |t|
      t.integer :pet_id
      t.integer :vaccine_id
      t.datetime :apply_at

      t.timestamps null: false
    end
  end
end
