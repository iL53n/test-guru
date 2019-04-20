module GistHelper
  def symbol_limit(text)
    text.truncate(25)
  end
end
