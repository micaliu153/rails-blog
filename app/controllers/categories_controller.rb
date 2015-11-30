class CategoriesController < ApplicationController
  layout "blog"

  
  def index
    @categories = Category.all

  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    
  end

  def edit
  end

  def create
    # render plain: params[:category].inspect
    @category = Category.new(category_params)

    if @category.save
       redirect_to @category
    else
      render 'new'
    end
  end

  def update
      @category = Category.find(params[:id])
      if @category.update(category_params)
        redirect_to @category
      else
        render 'edit'
      end
  end

  def destroy
      @category = Category.find(params[:id])

      @category.destroy
     
      redirect_to categories_path
  end


  def category_params
    params.require(:category).permit(:name)
  end
end
