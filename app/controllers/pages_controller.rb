class PagesController < ApplicationController
  before_action :set_page, only: %i[edit update show]
  before_action :parent, only: %i[new create]

  def index
    @pages = Page.all
    @root_pages = Page.roots
  end

  def edit
    # render plain: params
    @params = params
  end

  def new
    @page = Page.new
    @page.parent = parent
  end

  def create
    @page = Page.new page_params
    @page.parent = parent
    if @page.save
      flash[:success] = 'Страница успешно создана!'
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @page.update page_params_update
      flash[:success] = 'Страница успешно обновлена!'
      redirect_to 'root'
    else
      render :edit
    end
  end

  def show
  end

  private

  def page_params
    params.require(:page).permit(:name, :title, :body)
  end

  def page_params_update
    params.require(:page).permit(:title, :body)
  end

  def parent
    parent = @page
  end

  def set_page
    @page = Page.find_by(name: params[:name])
  end
end
