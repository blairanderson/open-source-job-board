module ApplicationHelper
  def site_title
    @settings.fetch('site.title')
  end

  def site_description
    @settings.fetch('site.description')
  end

  def github_repo
    "http://www.github.com/blairanderson/open-source-job-board"
  end

  def render_hero_suggestion
    content_tag :div, class: 'content-well' do
      [
        content_tag(:h1, 'Create your first Job Post!'),
        content_tag(:p, 'People will be here soon to find your awesome jobs. Go Ahead and post the first one!'),
        link_to("add your first post", new_post_path)
      ].join.html_safe
    end
  end
end
