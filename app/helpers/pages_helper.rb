module PagesHelper
  def page_path(*page)
    page = page[0] if page.instance_of? Array
    page.path.pluck(:name).join('/')
  end

  # build tree structure from model page
  def nested_pages(pages)
    pages.map do |page, sub_pages|
      render(page) + content_tag(:div, nested_pages(sub_pages), class: 'nested_pages')
    end.join.html_safe
  end

  # formating text with caston tags to text with html tags
  # castom tag: **string** => html tag: <b>string</b>
  # castom tag: \\string\\ => html tag: <i>string</i>
  def plain_to_html(text)
    b_mask = /(\*{2})(.*?)(\*{2})/
    i_mask = /(\\\\)(.*?)(\\\\)/
    link_mask = /(\(\()(.*?) (\[(.*?)\])(\)\))/

    text = text.gsub(link_mask) { "<a href=\"#{Regexp.last_match(2)}\">#{Regexp.last_match(4)}</a>" }
    text = text.gsub(b_mask) { "<b>#{Regexp.last_match(2)}</b>" }
    text.gsub(i_mask) { "<i>#{Regexp.last_match(2)}</i>" }
  end

  # formating text with html tags to text with castom tags
  def html_to_plain(text)
    b_tag = %r{(<b>)(.*?)(</b>)}s
    i_tag = %r{(<i>)(.*?)(</i>)}s
    link_tag = %r{(<a href=\")(.*?)(\">)(.*?)(</a>)}s

    text = text.gsub(link_tag) { "((#{Regexp.last_match(2)} [#{Regexp.last_match(4)}]))" }
    text = text.gsub(b_tag) { "**#{Regexp.last_match(2)}**" }
    text.gsub(i_tag) { "\\\\#{Regexp.last_match(2)}\\\\" }
  end
end
