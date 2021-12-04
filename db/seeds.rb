Page.destroy_all
puts "Destroyed everything you touch"

10.times do |i|
  name = "name#{i + 1}"
  title = Faker::Hipster.sentence(word_count: 2)
  body = Faker::Lorem.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 4)
  page = Page.create! name: name, title: title, body: body
  puts "created Page with title: '#{page.title}'"
end

# create page tree
parents = [nil, 0, 1, 2, 0, 4, 5, nil, nil, nil]
page_ids = Page.ids 
parents.map! { |i| page_ids[i] unless i == nil } 
# example: 
# page_ids = [41, 42, 43, 44, 45, 46, 47, 48, 49, 50]
# parents.map! => [nil, 41, 42, 43, 41, 45, 46, nil, nil, nil]

page_ids.each_with_index do |page, index|
  page = Page.find(page)
  page.parent_id = parents[index]
  page.save
end

puts '-----------'
puts 'creted tree from pages'
