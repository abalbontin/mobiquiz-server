class QuestionsController < ApplicationController

  def new

  end

  def create
    @question = Question.new(question_params)

    @question.save
    redirect_to @question
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.all
  end

  private
    def question_params
      params.require(:question).permit(:question, :answer1, :answer2, :answer3, :answer4, :solution, :difficulty)
    end

end
