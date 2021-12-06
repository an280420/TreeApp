module PageHelper
  def ancestry_path(page)
    page.path_ids.map { |page_id| Page.find(page_id).name }.join('/')
  end
end
