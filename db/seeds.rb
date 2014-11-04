Voter.delete_all

parties = ["Whigs", "Torries"]

20.times do
  Voter.create!(name: Faker::Name.name, party: parties.sample, api_key: SecureRandom.uuid)
end
