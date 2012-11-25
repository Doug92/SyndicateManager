# == Schema Information
#
# Table name: winning_numbers
#
#  id                   :integer          not null, primary key
#  winning_numbers_date :datetime
#  winning_number_1     :integer
#  winning_number_2     :integer
#  winning_number_3     :integer
#  winning_number_4     :integer
#  winning_number_5     :integer
#  winning_number_6     :integer
#  winning_number_bonus :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'test_helper'

class WinningNumberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
