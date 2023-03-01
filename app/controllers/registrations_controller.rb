class RegistrationsController < Devise::RegistrationsController
  private

  def after_sign_up_path_for(resource)
    dashboard_path
  end
  def sign_up_params
    params.require(:user).permit(
      :firstname,
      :lastname,
      :email,
      :password,
      :password_confirmation,
    )
  end

  def user_update_params
    params.require(:user).permit(
      :firstname,
      :lastname,
      :email,
      :password,
      :password_confirmation,
      :current_password,
    )
  end
end
