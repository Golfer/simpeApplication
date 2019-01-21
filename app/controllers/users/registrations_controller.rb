module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters, if: :devise_controller?

    def update_resource(resource, params)
      # resource.build_account
      resource.update_with_password(params)
    end

    protected

      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, account_attributes: [:id, :balance, :currency]])
      end
  end
end
