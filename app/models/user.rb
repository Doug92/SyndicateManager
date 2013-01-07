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

class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :user_firstname, :user_surname, :current_balance, \
    :user_status, :admin, :manager  # , :user_type
  has_secure_password
  has_and_belongs_to_many :syndicates
  #validates_associated :syndicates
  has_many :payments
  #validates_associated :payments
  validates :user_firstname, :user_surname, :presence => true

  #Michael Hartl Tutorial Listing 6.17
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
  before_save { |user| user.email = email.downcase }

  validates :password, presence: true, length: { minimum: 6 },  :if => :admin?
  validates :password_confirmation, presence: true,    :if => :admin?

  before_save :create_remember_token


  #validates :user_type,
  #    :inclusion  => { :in => [ 'Member', 'Super', 'Manager' ] ,
  #    :message    => "%{value} is not a valid user type" }


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

  #def is_admin?
  #    if (current_user.admin == true)
  #      true
  #    else
  #      redirect_to root_url
  #    end
  #  end


  def add_syndicate
    @user = User.find(session[:user_id])
    @user.syndicates
    s = Syndicates.new
    s.syndicate_name
    s.save
    @user.syndicates.push(s)
  end


  #def payment_all_minus
   #   @users.each do |user|
   #       @user = User(params[:id])
   #       @user.current_balance -= 1
   #       @user.save
   #   end



  def add_payment
    @user = User.find(session[:user_id])
        @user.payments
        s = payments.new
        s.payment_amount
        s.save
        @user.payments.push(s)
  end

  private

      def create_remember_token
        self.remember_token = SecureRandom.urlsafe_base64
      end

end
