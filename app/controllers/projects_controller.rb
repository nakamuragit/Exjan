class ProjectsController < ApplicationController
  def index
    @projects = Project.page(params[:page]).per(6)
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

  
end
