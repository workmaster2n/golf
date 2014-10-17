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
