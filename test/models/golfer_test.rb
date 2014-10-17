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

require 'test_helper'

class GolferTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
