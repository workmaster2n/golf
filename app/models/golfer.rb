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
  has_many :competitors
  has_many :games, through: :competitors

  accepts_nested_attributes_for :scores
end
