class ProjectsController < ApplicationController
  
  def new
  	@project= Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def index
  	@projects = Project.all
  end
  def create
    @project = Project.new(project_params)    # Not the final implementation!
    if @project.save
      flash[:success] = "Tao du an thanh cong!"
      redirect_to @project
    else
      render 'new'
    end
  end
  private 

  	def project_params
  		params.require(:project).permit(:project_name, :plan_time, :real_time)
  	end
end
