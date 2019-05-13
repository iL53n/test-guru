class BadgeAwardService

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    Badge.all.each do |badge|
      add_badge(badge) if send("#{badge.rule}?", badge.rule_param)
    end
  end

  private

  def add_badge(badge)
    @user.badges << badge
  end

  def category_complete?(category)
    @test_passage.success? && Test.tests_by_category(category).count == @user.tests.tests_by_category(category).uniq.count
  end

  def level_complete?(level)
    @test_passage.success? && Test.where(level: level).count == @user.tests.where(level: level).uniq.count
  end

  def first_attempt_complete?(_test)
    @test_passage.success? && @user.tests.where(title: @test.title).count == 1
  end
end