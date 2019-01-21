class LandingController < ApplicationController
  before_action :list_of_messages
  private
    def list_of_messages
      @messages =
        if current_user.present? && current_user.is_admin?
          Message.where(reply: [nil, ''])
        elsif current_user.present?
          Message.where(user: current_user)
        else
          Message.all
        end
    end
end
