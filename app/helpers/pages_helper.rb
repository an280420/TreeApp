module PagesHelper
  def page_path(*page)
    page = page[0] if page.instance_of? Array
    page.path.pluck(:name).join('/')
  end

  def nested_pages(pages)
    pages.map do |page, sub_pages|
      render(page) + content_tag(:div, nested_pages(sub_pages), class: "nested_pages")
    end.join.html_safe
  end

  # B_MASK replacement will match the link part of the LINK_MASK, so links tag should match before bold tag
  def plain_to_html(text)
    b_mask = /(\[)(.*?)(\])/s
    i_mask = /(\\\\)(.*?)(\\\\)/s
    link_mask = /(\(\()(.*?) (\[(.*?)\])(\)\))/s

    text = text.gsub(link_mask) { "<a href=\"#{Regexp.last_match(2)}\">#{Regexp.last_match(4)}</a>" }
    text = text.gsub(b_mask) { "<b>#{Regexp.last_match(2)}</b>" }
    text.gsub(i_mask) { "<i>#{Regexp.last_match(2)}</i>" }
  end

  # Will replace HTML tags with custom tag application
  def html_to_plain(text)
    html_b_mask = %r{(<b>)(.*?)(</b>)}s
    html_i_mask = %r{(<i>)(.*?)(</i>)}s
    html_link_mask = %r{(<a href=\")(.*?)(\">)(.*?)(</a>)}s

    text = text.gsub(html_link_mask) { "((#{Regexp.last_match(2)} [#{Regexp.last_match(4)}]))" }
    text = text.gsub(html_b_mask) { "[#{Regexp.last_match(2)}]" }
    text.gsub(html_i_mask) { "\\\\#{Regexp.last_match(2)}\\\\" }
  end
end
