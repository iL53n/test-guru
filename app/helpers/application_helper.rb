module ApplicationHelper
  def current_year
    Date.today.year
  end

  def github_url(author, repo)
    repo == '' ? name = author : name = repo

    link_to name,
            "https://github.com/#{author}/#{repo}",
            target: '_blank'
  end
end