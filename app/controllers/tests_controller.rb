class TestsController < ApplicationController

  before_action :find_test, only: %i[edit show update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def show
    #empty
  end

  def edit
    #empty
  end

  def update
    if @test.save
      redirect_to @test
    else
      render :edit
    end

  end

  def destroy
    @test.destroy
    render plain: "You destroy the test"
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found', status: 404
  end

  def test_params
    params.require(:test).permit(:title, :level)
  end
end

