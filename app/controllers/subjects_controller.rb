class SubjectsController < ApplicationController
  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = Subject.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subjects }
    end
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    if params[:subject_id]
     @subject = Subject.find(params[:subject_id])
     #category =  Category.find(params[:category_id])
     @tutorials = Tutorial.where(:subject_id => @subject)
    else
     @tutorials = Tutorial.all
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subject }
    end
  end

 
end
