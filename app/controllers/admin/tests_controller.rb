class Admin::TestsController < Admin::BaseController

  before_action :set_test, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.author_tests.new(test_params)

    if @test.save
      redirect_to admin_test_path(@test), notice: t('.create',
                                                    author_first_name: current_user.first_name,
                                                    author_last_name: current_user.last_name)
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
      redirect_to admin_test_path(@test), notice: t('.update')
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path, notice: t('.delete')
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render plain: 'Test was not found', status: 404
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end

