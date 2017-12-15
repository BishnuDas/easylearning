class UniversitiesController < ApplicationController
  # GET /universities
  # GET /universities.json
  def index
    @universities = University.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @universities }
    end
  end

  # GET /universities/1
  # GET /universities/1.json
  def show
    if params[:university_id]
     @university = University.find(params[:university_id])
     #category =  Category.find(params[:category_id])
     @tutorials = Tutorial.where(:university_id => @university)
    else
     @tutorials = Tutorial.all
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @university }
    end
  end

  
end
