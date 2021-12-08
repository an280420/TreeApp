require 'rails_helper'
include PagesHelper

RSpec.describe PagesHelper, type: :helper do
  
  describe '#build_page_path' do
    let(:page1) { FactoryBot.create(:page, name: 'name1') }
    let(:page2) { FactoryBot.create(:page, name: 'name2', parent: page1) }
    let(:page3) { FactoryBot.create(:page, name: 'name3', parent: page2) }
    let(:page4) { FactoryBot.create(:page, name: 'name4', parent: page3) }

    it 'returns page path' do
      expect(build_page_path(page4)).to eq('/name1/name2/name3/name4')
    end
  end
end
