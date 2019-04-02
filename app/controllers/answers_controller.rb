class AnswersController < ApplicationController
  before_action :set_answer, only: %i[show edit update destroy]
  before_action :find_question, only: %i[new create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_answer_not_found

  def show
  end

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to @answer
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @answer.update(answer_params)
      redirect_to @answer
    else
      render :edit
    end
  end


  def destroy
    @answer.destroy
    redirect_to question_path(@answer.question)
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def rescue_with_answer_not_found
    render plain: 'Answer was not found', status: 404
  end

  def answer_params
    params.require(:answer).permit(:body)
  end
end