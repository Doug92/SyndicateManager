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

class LotterySelection < ActiveRecord::Base
  attr_accessible :lottery_selection_1, :lottery_selection_2, :lottery_selection_3, :lottery_selection_4,\
   :lottery_selection_5, :lottery_selection_6, :lottery_selection_date, :syndicate_id
  belongs_to :winning_number

  #validates_associated :winning_number
  validates :lottery_selection_1, :lottery_selection_2, :lottery_selection_3, :lottery_selection_4,\
   :lottery_selection_5, :lottery_selection_6, :presence => true, :numericality => {:greater_than_or_equal_to => 1}, \
   :numericality => {:less_than_or_equal_to => 49}

  UNIQU_FIELDS = [:lottery_selection_1, :lottery_selection_2, :lottery_selection_3, :lottery_selection_4,\
     :lottery_selection_5, :lottery_selection_6]

    validate :lottery_numbers_are_unique

    def lottery_numbers_are_unique
        unless UNIQU_FIELDS.map{|field| self[field] }.uniq.length == UNIQU_FIELDS.length
          errors[:base] << "You have repeated one or more numbers for that day's draw"
        end
    end
end
