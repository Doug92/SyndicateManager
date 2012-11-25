# == Schema Information
#
# Table name: lottery_selections
#
#  id                     :integer          not null, primary key
#  syndicate_id           :integer
#  lottery_selection_1    :integer
#  lottery_selection_2    :integer
#  lottery_selection_3    :integer
#  lottery_selection_4    :integer
#  lottery_selection_5    :integer
#  lottery_selection_6    :integer
#  lottery_selection_date :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'test_helper'

class LotterySelectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
