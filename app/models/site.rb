class Site < ActiveRecord::Base
  attr_accessible :name, :description, :min_depth, :max_depth, :avg_depth, :nitrox_mix, :difficulty
end
