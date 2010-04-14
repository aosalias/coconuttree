class Course < ActiveRecord::Base
  require 'paperclip'
  attr_accessible :time, :course_price, :book_price, :prereqs, :description, :title, :image_path

end
