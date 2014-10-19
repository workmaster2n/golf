# == Schema Information
#
# Table name: golfers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  birthday   :date
#  created_at :datetime
#  updated_at :datetime
#

class Golfer < ActiveRecord::Base
  has_many :scores

  accepts_nested_attributes_for :scores
end
