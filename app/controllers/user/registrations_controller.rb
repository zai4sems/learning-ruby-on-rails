class User::RegistrationsController < Devise::RegistrationsController
    before_filter :configure_permitted_parameters
    
    protected
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :hour_worked_per_week, :no_of_week_holiday_per_year])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :first_name, :hour_worked_per_week, :no_of_week_holiday_per_year ])
    end
end