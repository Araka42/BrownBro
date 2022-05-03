class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]


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
    @project.user = current_user
    @project.category.compact_blank!
    if @project.category.count == 1
      @category = Category.find_by(title: @project.category)
      if @project.save!
        Jointure.create(project_id: @project.id, category_id: @category.id)
        redirect_to project_path(@project)
      else
        render :new
      end
    elsif @project.categories.count > 1
      @project.categories.each do |category|
        category = Category.find_by(title: category)
        if @project.save!
          Jointure.create(project_id: @project.id, category_id: category.id)
          redirect_to project_path(@project)
        else
          render :new
        end
      end
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
    params.require(:project).permit(:title, :description, :user_id, :video_url, :user_id, :created_at, :updated_at, :category)
  end
end
