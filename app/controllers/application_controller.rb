class ApplicationController < ActionController::Base 
	before_action :configure_permitted_parameters, if: :devise_controller?
	def after_sign_in_path_for(resource)
		flash[:in]="Signed in successfully."
		user_path(resource.id)
	end
	def after_sign_out_path_for(resource)
		flash[:out]="Signed out successfully."
		root_path
	end
	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
		devise_parameter_sanitizer.permit(:account_update, keys: [:name])
	end
end
