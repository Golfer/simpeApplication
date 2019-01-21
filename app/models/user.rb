class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include Users::RegistrationNotificationMailer

  has_many :messages
  has_one :account, inverse_of: :user

  accepts_nested_attributes_for :account

  def is_admin?
    is_admin
  end

  def full_name
    [first_name, last_name].compact.collect(&:capitalize).join(' ').strip
  end
end
