class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(parmas[:id])
  end

  def create
    @project = Project.new(project_params)
    @category = Category.find(params[:category_id])
    @project.user = current_user
    if @project.save!
      Jointure.create(project: @project, category: @category)
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def new
    @project = Project.new
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to projects_path
  end

  def edit
    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :user_id, :video_url, :user_id, :created_at, :updated_at)
  end
end
