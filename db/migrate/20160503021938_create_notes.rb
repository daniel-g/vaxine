class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :text
      t.datetime :reviewed_at

      t.timestamps null: false
    end
  end
end
