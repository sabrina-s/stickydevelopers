class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :birthdate, :uid, :provider)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :current_password, :birthdate, :default_shipping, :default_billing)
  end

  protected

  def after_update_path_for(resource)
    edit_user_registration_path
  end
end
