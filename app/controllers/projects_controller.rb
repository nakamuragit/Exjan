class ProjectsController < ApplicationController
  before_action :set_search, only: [:index, :search]

  def index
    # @projects = Project.page(params[:page]).per(6)
  end

  def search
  end

  

  def show
    @project = Project.find(params[:id])
    if current_user.channel_follower.nil?
      redirect_to user_path(current_user)
    end
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
