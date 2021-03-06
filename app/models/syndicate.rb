# == Schema Information
#
# Table name: syndicates
#
#  id             :integer          not null, primary key
#  syndicate_name :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  status         :string(255)      default("pending")
#

class Syndicate < ActiveRecord::Base
  attr_accessible :syndicate_name, :status
  has_and_belongs_to_many :users
  #validates_associated :users
  has_many :lottery_selections
  #validates_associated :users
end
