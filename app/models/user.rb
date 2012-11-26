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

class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :user_firstname, :user_surname, :current_balance, \
    :user_payment_status, :user_status, :user_type, :admin, :manager
  has_secure_password
  has_and_belongs_to_many :syndicates
  #validates_associated :syndicates
  has_many :payments
  #validates_associated :payments
  validates :user_firstname, :user_status, :user_surname, :presence => true

  #Michael Hartl Tutorial Listing 6.17
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
  before_save { |user| user.email = email.downcase }

  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  before_save :create_remember_token


  validates :user_type,
      :inclusion  => { :in => [ 'Member', 'Super', 'Manager' ] ,
      :message    => "%{value} is not a valid user type" }


  # New Syndicate Manager, Approved Manager >> By Superuser.
  validates :user_status,
        :inclusion  => { :in => [ 'new', 'approved' ] ,
        :message    => "%{value} is not a valid status type" }

  #http://stackoverflow.com/questions/2390553/rails-add-record-to-join-table-from-controller

 # def add_syndicate
 #   @user = User.find(session[:user_id])
 #   @syndicates = Syndicate.find(params[:id])
 #   @user.syndicates << @syndicates
 #   flash[:notice] = 'Syndicate Detail was saved.'
 # end



  private

      def create_remember_token
        self.remember_token = SecureRandom.urlsafe_base64
      end

end
