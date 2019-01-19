class UserNotificationMailer < ApplicationMailer
  def send_new_user_message(user)
    @user = user
    mail(to: @user.email,
         subject: 'Thanks for registration in our App')
  end
end
