class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def edit
  end

  def new
    @page = Page.new
  end
end
