class FeedbacksMailer < ApplicationMailer
  def send_feedback(feedback)
    @user = feedback.user
    @title = feedback.title
    @message = feedback.message

    @admin = User.find_by(type: 'Admin')

    mail to: @admin.email
  end
end
