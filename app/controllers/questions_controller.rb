class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.inspect
  end

  def create
    @test.questions.new(question_params)
  end

  def new
    # empty
  end

  # def edit
  # end

  def show
    render plain: @question.body
  end

  # def update
  # end

  def destroy
    @question.destroy
    render plain: "You destroy the question"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found', status: 404
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
