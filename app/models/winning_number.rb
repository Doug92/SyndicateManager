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

class WinningNumber < ActiveRecord::Base
  attr_accessible :winning_number_1, :winning_number_2, :winning_number_3, :winning_number_4, :winning_number_5,\
   :winning_number_6, :winning_number_bonus, :winning_numbers_date
  has_many :lottery_selections
  #validates_associated :lottery_selections
  validates :winning_number_1, :winning_number_2, :winning_number_3, :winning_number_4, :winning_number_5,\
   :winning_number_6, :winning_number_bonus, :presence => true, :numericality => {:greater_than_or_equal_to => 1}, \
   :numericality => {:less_than_or_equal_to => 49}

  #validates :winning_number_1, :winning_number_2, :winning_number_3, :winning_number_4, :winning_number_5,\
  #   :winning_number_6, :winning_number_bonus, uniqueness: {scope: [:id, :winning_number_1, \
   #  :winning_number_2, :winning_number_3, :winning_number_4, :winning_number_5,\
    #    :winning_number_6, :winning_number_bonus]}
  #validates_uniqueness_of :winning_number_1, :winning_number_2, :winning_number_3, :winning_number_4,\
  # :winning_number_5, :winning_number_6, :winning_number_bonus, :scope => :winning_number_id

  #Below checks that for any given date there can only be one set of winning numbers
  validates :winning_numbers_date, uniqueness: { scope: [:winning_number_1, :winning_number_2, :winning_number_3,\
   :winning_number_4, :winning_number_5, :winning_number_6, :winning_number_bonus] }

  #doesn't work    - I want it to check all attributes on single row for uniqueness. This checks column uniqueness
  #validates_uniqueness_of :winning_number_1, :winning_number_2, :winning_number_3,\
     #  :winning_number_4, :winning_number_5, :winning_number_6, :winning_number_bonus
end

       #rails custom validation on google
