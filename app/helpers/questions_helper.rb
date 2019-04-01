module QuestionsHelper
  def question_header(question)
    title = question.test.title

    header = if question.new_record?
             "Create New #{title} Question"
           else
             "Edit #{title} Question"
           end

    content_tag('h1', header)
  end
end