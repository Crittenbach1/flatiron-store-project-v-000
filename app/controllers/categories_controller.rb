class CategoriesController < ApplicationController
  def index
    #binding.pry
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end
end
