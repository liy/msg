class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :uri
      t.integer :entry_id

      t.timestamps
    end
  end
end
