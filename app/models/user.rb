class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :articles
  validate :password_complexity
  def password_complexity
   if password.present?
     if !password.match(/^(?=.*[a-z])(?=.*[A-Z])/)
       errors.add :password, "Password complexity requirement not met"
     end
   end
end
end
