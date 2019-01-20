class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include Users::RegistrationNotificationMailer

  has_many :messages
  has_one :account

  def is_admin?
    is_admin
  end

  def full_name
    [first_name, last_name].join(' ')
  end
end
