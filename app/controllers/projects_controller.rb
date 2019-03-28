class ProjectsController < ApplicationController
  before_action :set_search, only: [:index, :search, :search_pay, :search_period, :search_method, :search_cutback, :search_site]

  def index
    # @projects = Project.page(params[:page]).per(6)
  end

  def search
  end

  def search_pay
  end

  def search_period
  end

  def search_method
  end


  def search_site
  end

  def show
    @project = Project.find(params[:id])
    if current_user.channel_follower.nil?
      redirect_to user_path(current_user)
    end
  end

  def how_to_use
  end

  private 
  
  def project_params
    params.require(:project).permit(:flag)
  end

  def set_search
    @q = Project.ransack(params[:q])
    @projects = @q.result.page(params[:page]).per(6)
  end
end
