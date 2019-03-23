class ProjectsController < ApplicationController
  def index
    @projects = Project.page(params[:page]).per(6)
  end

  def show
    @project = Project.find(params[:id])
  end

  private 
  
  def project_params
    params.require(:project).permit(:flag)
  end

  
end
