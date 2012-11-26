# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  user_surname        :string(255)
#  user_firstname      :string(255)
#  email               :string(255)
#  user_status         :string(255)
#  user_payment_status :string(255)
#  user_type           :string(255)
#  current_balance     :decimal(4, 2)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  password_digest     :string(255)
#  remember_token      :string(255)
#  admin               :boolean          default(FALSE)
#  manager             :boolean          default(FALSE)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
