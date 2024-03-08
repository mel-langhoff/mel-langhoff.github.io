class ProjectsController < ApplicationController
  def index
    @projects = Projects.all
  end
  
  def show
    @project = Project.find(params[:id])
  end

  def connect_four
    output = ConnectFour.run
    render json: { output: output }
  end

end