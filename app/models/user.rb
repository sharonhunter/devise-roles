class User < ActiveRecord::Base
  
  #the enum module below allows each role to be represented as an integer in db
  #but each can be accessed/queried as a string
  #:user is position 0, so :user's db integer is 0, :admin is 1, :vip is 2
  enum role: [:user, :admin, :vip]
  after_initialize :set_default_role, :if => :new_record?

  #role is set to user by default when User initialized
  def set_default_role
  	 self.role ||= :user
  	end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
