class Admin::AnswersController < Admin::BaseController
  before_action :authenticate_user!
  before_action :set_answer, only: %i[show edit update destroy]
  before_action :set_question, only: %i[new create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_answer_not_found

  def show
  end

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to admin_answer_path(@answer), notice: 'Add new answer!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @answer.update(answer_params)
      redirect_to admin_answer_path(@answer), notice: 'Update answer!'
    else
      render :edit
    end
  end


  def destroy
    @answer.destroy
    redirect_to admin_question_path(@answer.question), notice: 'Delete answer!'
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def rescue_with_answer_not_found
    render plain: 'Answer was not found', status: 404
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end
