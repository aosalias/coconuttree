class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.string :name
      t.string :country
      t.string :title
      t.string :position
      t.string :avatar_file_name
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
