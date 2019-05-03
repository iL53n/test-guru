class FeedbacksController < ApplicationController

  def show; end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = current_user.feedbacks.new(feedback_params)

    if @feedback.save
      TestsMailer.send_feedback(@feedback).deliver_now
      redirect_to root_path, notice: 'You send feedback!'
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:title, :messages, :user_id)
  end

end