class QuestionsController < ApplicationController

  http_basic_authenticate_with name: "user", password: "secret"

  def new
       @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      flash[:notice] = 'Has creado una pregunta correctamente. Oh yeah!'
      redirect_to @question
    else
      flash[:error] = 'La pregunta no se ha podido crear... jo (revisa los errores)'
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.all
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      flash[:notice] = 'Has actualizada la pregunta :)'
      redirect_to @question
    else
      flash[:error] = 'No se ha podido actualziar la pregunta :('
      render 'edit'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    flash[:notice] = 'Pregunta borrada, eliminada, desaparecida de la faz de la tierra!!! vamos que ya no está :D'

    redirect_to questions_path
  end

  private
    def question_params
      params.require(:question).permit(:question, :answer1, :answer2, :answer3, :answer4, :solution, :difficulty)
    end

end
