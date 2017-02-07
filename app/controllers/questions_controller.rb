class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end
  
  def create
    @question = Question.new
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]
    @question.resolved = params[:question][:resolved]
    
    if @question.save
      flash[:notice] = "Question was successfully saved"
      redirect_to @question
    else
      flash[:alert] = "there was an error trying to save the question.Please try again later"
      render :new
    end
  end
  
  def update
    @question = Question.find(params[:id])
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]
    @question.resolved = params[:question][:resolved]
    
    if @question.save
      flash[:notice] = "Questions update was successfully saved"
      redirect_to @question
    else
      flash[:alert] = "There was an error trying to update the question.Please try again later"
      render :edit
    end
  end
  
  def destroy
    @question = Question.find(params[:id])
    
    if @question.destroy
      flash[:notice] = "\"#{@question.title}\" was deleted successfully. "
      redirect_to questions_path
    else
      flash[:alert] = "There was an error trying to delete the question"
      render :show
    end
  end
  
end
