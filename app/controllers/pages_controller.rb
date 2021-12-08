class PagesController < ApplicationController
  before_action :set_page, only: %i[show edit update]
  before_action :set_parent_id, only: :new

  include PagesHelper

  def index
    @pages = Page.all
  end

  def new
    # render plain: params
    @page = Page.new(parent_id: @parent_id)
    if @parent_id
      render :new
    else
      render :new_root
    end
  end

  def edit
    @page.body = html_to_plain(@page.body)
  end

  def create
    @page = Page.new page_params
    @page.body = plain_to_html(@page.body)
    if @page.save
      flash[:success] = 'Страница успешно создана!'
      redirect_to build_page_path(@page)
    else
      render :new
    end
  end

  def update
    if @page.update page_params_update
      @page.body = plain_to_html(@page.body)
      @page.save
      flash[:success] = 'Страница успешно обновлена!'
      redirect_to page_path
    else
      render :edit
    end
  end

  def show
    @pages = @page.descendants
  end

  private

  def page_params
    params.require(:page).permit(:name, :title, :body, :parent_id)
  end

  def page_params_update
    params.require(:page).permit(:title, :body)
  end

  def set_page
    _page_path = params[:page_path]
    name_page = _page_path.split('/').last
    @page = Page.find_by(name: name_page)
  end

  def set_parent_id
    if params[:page_path]
      set_page
      @parent_id = @page.id
    else
      @parent_id = nil
    end
  end
end
