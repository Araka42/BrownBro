class JointuresController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @category = Category.find(params[:category_id])
    @jointure = Jointure.new(project: @project, category: @category)
    @jointure.save!
    redirect_to project_path(@project)
  end

  def update
  end

  def destroy
  end

end
