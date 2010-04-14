class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.string  :title
      t.string :time
      t.string :course_price
      t.string :book_price
      t.string :image_path
      t.text :prereqs
      t.text :description
      t.timestamps
    end
  end
  
  def self.down
    drop_table :courses
  end
end
