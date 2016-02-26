require 'net/http'
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

  def edit
    @project= Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = "Profile updated"
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    flash[:success] = "Project deleted"
    redirect_to projects_url
  end

  def report
    code = params[:code]
    res = auth(code)
    @token =res.get_token if !res.nil?
  end
  def auth(code)
    uri = URI("https://slack.com/api/oauth.access?client_id=2760961654.22987639603&client_secret=3213c7b05a20bdffdbfb1c42a94f1e2b&code=#{code}&redirect_uri=http://localhost:3000/report")
    res = Net::HTTP.get_response(uri) 
    if res.is_a?(Net::HTTPSuccess)
      res.body
    else
      nil
    end
  end

  def get_token(res)
  res.split(',')[1].split(':')[1].delete("\"")
  end

  private 

  	def project_params
  		params.require(:project).permit(:project_name, :plan_time, :real_time)
  	end
end
