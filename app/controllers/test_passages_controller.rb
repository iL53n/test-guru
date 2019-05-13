class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids]) # можно опустить после time_is_out? чтобы не засчитывать

    if @test_passage.time_is_out?
      flash[:alert] = 'Time is out!'
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
      return # чтобы выйти и не проверять completed?
    end

    if @test_passage.completed?
      BadgeAwardService.new(@test_passage).call

      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    question = @test_passage.current_question
    service = GistQuestionService.new(question)
    response = service.call
    url = response.html_url

    flash = if service.success?
              current_user.gists.create(question: question, url: url)
              { notice: t('.success', url: url) }
            else
              { alert: t('.failure') }
            end

    redirect_to @test_passage, flash
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
