class CategoriesController < ApplicationController
  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    if params[:category_id]
     @category = Category.find(params[:category_id])
     #category =  Category.find(params[:category_id])
     @tutorials = Tutorial.where(:category_id => @category)
    else
     @tutorials = Tutorial.all
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end

end
