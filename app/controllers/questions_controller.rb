class QuestionsController < ApplicationController

  before_action :set_test, only: %i[new create]
  before_action :set_question, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def show
    # @answers = @question.answers
  end

  def edit
    # empty
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end

  end

  def destroy
    @question.destroy
    redirect_to test_path(@question.test)
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found', status: 404
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end
end
