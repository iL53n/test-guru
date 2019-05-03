class FeedbacksMailer < ApplicationMailer
  def send_feedback(feedback)
    @user = feedback.user

    mail to: @user.email
  end
end
