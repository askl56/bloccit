class QuestionsController < ApplicationController
  def index
  	@question = Question.all
  end

  def show
  	@question = Question.find(params[:id])
  end

  def new 
  	@question = Question.new 
  end

  def edit
  	@Question = Question.find(params[:id])
  end
end
