# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  user_surname    :string(255)
#  user_firstname  :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean          default(FALSE)
#  manager         :boolean          default(FALSE)
#  current_balance :decimal(4, 2)    default(0.0)
#  user_status     :string(255)      default("new")
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
