class Course < ActiveRecord::Base
  require 'paperclip'
  attr_accessible :time, :course_price, :book_price, :prereqs, :description, :title, :image_path

  named_scope :tec, :conditions => ['id BETWEEN 18 AND 20']
  named_scope :rec, :conditions => ['id BETWEEN 1 AND 6 AND id != 5']
  named_scope :pro, :conditions => ['id BETWEEN 14 AND 17 OR id = 7']
  named_scope :spec, :conditions => ['id BETWEEN 8 AND 12 OR id = 4']

end
