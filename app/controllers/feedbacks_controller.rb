class FeedbacksController < ApplicationController

  def show; end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.save
      redirect_to admin_answer_path(@answer), notice: 'You send feedback!'
    else
      render :new
    end
  end

end