class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries, :id => false do |t|
      t.string :uuid, :primary => true

      t.text :content, :limit => nil
      t.string :password
      
      t.timestamps
    end
  end
end
