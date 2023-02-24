# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      set_flash_message_for_update(resource, prev_unconfirmed_email)
      bypass_sign_in resource, scope: resource_name if sign_in_after_change_password?

      redirect_back_or_to user_path
    else
      clean_up_passwords resource
      set_minimum_password_length

      alert =
        if !resource.errors['current_password'].empty?
          "Current password #{resource.errors['current_password'][0]}"
        elsif !resource.errors['password'].empty?
          "New password #{resource.errors['password'][0]}"
        else
          "Password confirmation #{resource.errors['password_confirmation'][0]}"
        end

      redirect_to user_security_path, flash: { alert: alert }
    end
  end

  protected

  def update_resource(resource, params)
    if params[:password]
      resource.update_with_password(params)
    else
      resource.update_without_password(params)
    end
  end
end
