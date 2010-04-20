class Member < ActiveRecord::Base
  attr_accessible :name, :country, :title, :avatar_file_name, :description, :position

  named_scope :management, :conditions => ["position = 'manager'"]
  named_scope :dive_staff, :conditions => ["position = 'dive_staff'"]
  named_scope :captains, :conditions => ["position = 'captain'"]
  named_scope :students, :conditions => ["position = 'student'"]
  named_scope :grads, :conditions => ["position = 'grad'"]
  named_scope :support, :conditions => ["position = 'support'"]

  named_scope :cult_leaders, :conditions => ["position = 'grad' AND title = 'cult_leader'"]
  named_scope :instructors, :conditions => ["position = 'grad' AND title = 'instructor'"]
  named_scope :divemasters, :conditions => ["position = 'grad' AND title = 'divemaster'"]
  named_scope :tecies, :conditions => ["position = 'grad' AND title = 'tec'"]
  named_scope :perfects, :conditions => ["position = 'grad' AND title = 'perfect'"]

  def first_name
    a = name.split(" ")
    a.slice!(-1) if a.size > 1
    a.join(" ")
  end

  def self.members_in_threes(type)
    members = Member.send(type)
    index = members.size/3
    members_in_3 = []
    (0...index+1).each do |i|
      base = i*3
      members_in_3[i] = [members[base], members[base+1], members[base+2]]
    end
    members_in_3
  end

end
