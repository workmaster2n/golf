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
  has_many :holes

  validates_uniqueness_of :name

  after_create :make_holes

  private

  def make_holes
    (1..18).each do |number|
      holes.create(number: number)
    end
  end

end
