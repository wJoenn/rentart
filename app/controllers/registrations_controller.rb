# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  protected

  def update_resource(resource, params)
    if params[:password]
      resource.update_with_password(params)
    else
      resource.update_without_password(params)
    end
  end

  def after_update_path_for(_resource)
    flash[:notice] = "Account succesfully updated"
    edit_user_registration_path
  end
end
