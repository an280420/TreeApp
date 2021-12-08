require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  let(:page1) { FactoryBot.create(:page) }
  let(:page2) { FactoryBot.create(:page, parent: page1) }

  context 'controller methods for root pages' do
    it 'GET /index' do
      get :index
      expect(page1.parent).to eq(nil)
    end

    it 'GET /show' do
      get :show, params: { page_path: "/#{page1.name}" }
      expect(page2.parent).to eq(page1)
    end
  end
end
