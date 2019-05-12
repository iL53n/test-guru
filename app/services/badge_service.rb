class BadgeService
  CATEGORY = 'mathematics'
  LEVEL = 1

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @rule_test = test_passage.test.rule
  end

  def call
    Badge.all.each do |badge|
      add_badge(badge) if send("#{@rule_test}?")
    end
  end

  def add_badge(badge)
    @user.badges << badge
  end

  def category_complete?(category)
    Test.tests_by_category(category).count == @user.tests.tests_by_category(category).uniq.count
  end

  def level_complete?(level)
    Test.tests_by_level(level).count == @user.tests.tests_by_level(level).uniq.count
  end

  def first_attempt_complete?
    @user.tests.where(id: @test_passage.test_id).count == 1 && @test_passage.passed?
  end

end