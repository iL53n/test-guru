class TestsController < ApplicationController

  before_action :find_test, only: %i[show edit update destroy start]
  before_action :find_user, only: :start

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

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
    @questions = @test.questions
  end

  def edit
    # empty
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def find_user
    @user = User.first
    # @user = User.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found', status: 404
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end

