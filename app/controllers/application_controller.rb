class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit([ :role ] + user_common_fields +
                   (params[:user][:role] == 'worker' ? user_worker_fields : []))
    end

    #devise_parameter_sanitizer.for(:account_update) do |u|
    #  u.permit(user_common_fields)
    #end
  end

  private

  def user_common_fields
    [ :email, :password, :password_confirmation, :fio, :mobile_phone, :home_phone ]
  end

  def user_worker_fields
    [ user_fields_attributes: [
        :salary, :experience, :employment, :learning_place, :skill_list ] ]
  end
end
