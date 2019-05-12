class BadgeService
  CATEGORY = 'mathematics'
  LEVEL = 1

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    Badge.all.each do |badge|
      add_badge(badge) if
    end
  end

  def add_badge(badge)
    @user.badges << badge
  end

  def category_complete?
    #
  end

  def level_complete?
    #
  end

  def first_attempt_complete?
    #
  end

end