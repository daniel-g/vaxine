class CreateVaccines < ActiveRecord::Migration
  def change
    create_table :vaccines do |t|
      t.string :name
      t.integer :periodicity

      t.timestamps null: false
    end
  end
end
