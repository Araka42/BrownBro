class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @projects = Project.all
    @categories = Category.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.categs.compact_blank!
    @categories = @project.categs
    @project.user = current_user
    if @project.save!
      @categories.each do |categ|
        category = Category.find_by(id: categ)
        Jointure.create(project_id: @project.id, category_id: category.id)
      end
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to projects_path
  end


  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :user_id, :video_url, :user_id, :created_at, :updated_at, categs: [])
  end
end
