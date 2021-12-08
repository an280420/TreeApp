FactoryBot.define do
  factory :page do
    name_pages = %w[name страница page]

    sequence(:name) { |n| "#{name_pages.sample}#{n}" }

    sequence(:title) { |n| "Заголовок №#{n}" }

    body { Faker::Lorem.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 4) }

    # association :page, as: :ancestry
  end
end
