FactoryBot.define do
  # Название фабрики (page)
  factory :page do
    name =%w[name страница page]

    sequence(:name) { |n| "#{name.sample}#{n}?" }

    title { Faker::Hipster.sentence(word_count: 1) }

    body { Faker::Lorem.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 4) }

    association :page, as: :ancestry
  end
end
