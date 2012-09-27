# coding: utf-8
module UserDecorator

  include ApplicationDecorator

  def member_since
    created_at.strftime("%B %e, %Y")
  end

  def avatar
    link_to_if url.present?, image_tag("avatars/#{avatar_name}", class: "avatar"), url
  end

  def linked_name
    site_link(full_name.present? ? full_name : username)
  end

  def website
    handle_none url do
      link_to url, url
    end
  end

  def twitter
    handle_none twitter_name do
      link_to twitter_name, "http://twitter.com/#{twitter_name}"
    end
  end

  # def deco_bio
  #   handle_none bio do
  #     Redcarpet.new(bio, :hard_wrap, :filter_html, :autolink).to_html.html_safe
  #   end
  # end

  def deco_bio
    handle_none bio do
      markdown bio
    end
  end

  private

  def handle_none(value)
    if value.present?
      yield
    else
      content_tag :span, "None given", class: "none"
    end
  end

  def site_link(content)
    link_to_if url.present?, content, url
  end

  def avatar_name
    if avatar_image_name.present?
      avatar_image_name
    else
      "default.png"
    end
  end

end
