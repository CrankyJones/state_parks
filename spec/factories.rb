FactoryBot.define do
  factory(:state) do
    name { Faker::Address.unique.state }
  end
  factory (:park) do
    name { Faker::Mountain.unique.name }
    description { Faker::Lorem.paragraph(sentence_count: 6)}
  end
end