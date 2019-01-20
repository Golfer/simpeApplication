class UserNotificationMailer < ApplicationMailer
  def send_new_user_message(user)
    @user = user
    mail(to: @user.email,
         subject: 'Thanks for registration in our App')
  end
  def sent_to_requester(message)
    @message = message
    mail(to: message.user.email,
         subject: 'Create new question for Support')
  end

  def send_request_to_support(message)
    @message = message
    @admins = User.where(is_admin: true).pluck(:email)
    mail(to: @admins,
         subject: 'Has new Question from user')
  end

  def reply_from_support(message)
    @message = message
    mail(to: @message.user.email,
         subject: 'Admin reply for your question')
  end
end
