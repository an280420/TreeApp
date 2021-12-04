class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def edit
    @page = Page.find params[:id]
  end

  def new
    @page = Page.new
  end

  def create
    # render plain: params
    @page = Page.new page_params
    if @page.save
      flash[:success] = 'Страница успешно создана!'
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @page = Page.find params[:id]
    if @page.update page_params_update
      flash[:success] = 'Страница успешно обновлена!'
      redirect_to page_path
    else
      render :edit
    end
  end


  def show
    @page = Page.find params[:id]
  end

  private

  def page_params
    params.require(:page).permit(:name, :title, :body)
  end

  def page_params_update
    params.require(:page).permit(:title, :body)
  end
end
