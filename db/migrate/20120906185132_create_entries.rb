class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :content, :limit => nil

      t.string :base64_id

      t.string :password
      
      t.timestamps
    end
  end
end
