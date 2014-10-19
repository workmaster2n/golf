# == Schema Information
#
# Table name: courses
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Course < ActiveRecord::Base
  has_many :holes, dependent: :destroy
  accepts_nested_attributes_for :holes

  validates_uniqueness_of :name
end
