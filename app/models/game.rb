# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  played_on  :date
#  created_at :datetime
#  updated_at :datetime
#

class Game < ActiveRecord::Base
end
