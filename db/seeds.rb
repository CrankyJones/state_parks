class Seed
  def self.begin
    seed = Seed.new
    seed.generate_parks
  end

  def generate_parks
    20.times do |i|
      state = State.create!(
        name: Faker::Address.unique.state)
      5.times do |i|
        park = Park.create!(
          name: Faker::Mountain.unique.name,
          description: Faker::Lorem.paragraph(sentence_count: 6),
          state_id: state.id
        )
      end

    end
  end
end
Seed.begin
p "Created #{State.count} states."
p "Created #{Park.count} parks."
