module Users
  module RegistrationNotificationMailer
    include ActiveSupport::Concern

    def self.included(base)
      base.class_eval do
        after_create :send_admin_mail
      end
    end

    def send_admin_mail
      UserNotificationMailer.send_new_user_message(self).deliver
    end
  end
end
