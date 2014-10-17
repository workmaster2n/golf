# == Schema Information
#
# Table name: holes
#
#  id         :integer          not null, primary key
#  number     :integer
#  course_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Hole < ActiveRecord::Base
  belongs_to :course

end
