module ApplicationHelper
  def current_year
    Date.today.year
  end

  def github_url(author, repo)
    name = repo.blank? ? author : repo

    link_to name,
            "https://github.com/#{author}/#{repo}",
            target: '_blank'
  end

  def flash_message(name)
    if flash[name]
      content_tag :p, flash[name], class: "flash #{name}"
    end
  end
end