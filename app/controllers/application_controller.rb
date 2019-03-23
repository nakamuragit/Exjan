class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_search
    @q = Project.ransack(params[:q])
    @projects = @q.result
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:active_site, :channel_name, :stage_name, :active_url, :channel_follower])
    devise_parameter_sanitizer.permit(:account_update, keys: [:active_site, :channel_name, :stage_name, :active_url])
  end
end