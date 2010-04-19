class Member < ActiveRecord::Base
  attr_accessible :name, :country, :title, :avatar_file_name, :description, :position

  named_scope :management, :conditions => ['position = "manager"']
  named_scope :dive_staff, :conditions => ['position = "dive_staff"']
  named_scope :captains, :conditions => ['position = "captain"']
  named_scope :students, :conditions => ['position = "student"']
  named_scope :grads, :conditions => ['position = "grad"']
  named_scope :support, :conditions => ['position = "support"']

  def first_name
    a = name.split(' ')
    a.slice!(-1) if a.size > 1
    a.join(' ')
  end

  def self.dmts_in_threes
    dmts = Member.students
    index = dmts.size/3
    dmts_in_3 = []
    (0...index+1).each do |i|
      base = i*3
      dmts_in_3[i] = [dmts[base], dmts[base+1], dmts[base+2]]
    end
    dmts_in_3
  end

end
