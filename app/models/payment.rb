# == Schema Information
#
# Table name: payments
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  payment_amount :decimal(4, 2)
#  payment_date   :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Payment < ActiveRecord::Base
  attr_accessible :payment_amount, :payment_date, :user_id
  belongs_to :users
  #validates_associated :users
  validates  :payment_amount, :payment_date, :user_id, :presence => true
end
