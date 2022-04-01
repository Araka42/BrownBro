class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def create
    @category = category.new(category_params)
    if @category.save!
      redirect to projects_path
    else
      render :new
    end
  end

  def destroy
    @category = category.find(params[:id])
    @category.destroy
    redirect_to projects_path
  end

  private

  def category_params
    params.require(:category).permit(:title, :created_at, :updated_at)
  end
end
