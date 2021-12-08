require 'rails_helper'

RSpec.describe Page, type: :model do
  context 'validations check' do
    # Проверяем наличие валидации
    it { should validate_presence_of :name }

    # Проверяем, что модель не разрешает значение 500
    it { should_not allow_value(' ').for(:name) }
    # Проверяем, разрешает ли наша модель значение 14
    it { should allow_value('name5').for(:name) }
  end
end
