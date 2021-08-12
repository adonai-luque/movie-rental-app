class CategoriesController < ApplicationController
  def index
    @pagy, @categories = pagy(Category.all)
  end

  def show
    @category = Category.find(params[:id])
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category, notice: "Category successfully created"
    else
      render :new, status: :unprocessable_entity, notice: "The category couldn't be created"
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to @category, notice: "Category successfully updated"
    else
      render :edit, status: :unprocessable_entity, notice: "The category couldn't be updated"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to root_path, notice: "Category successfully deleted"
  end

  private
  
  def category_params
    params.require(:category).permit(:id, :name, :description)
  end
end
