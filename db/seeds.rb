Voter.delete_all
Seat.delete_all
Candidate.delete_all
Vote.delete_all


parties = ["Whigs", "Torries"]

200.times do
  Voter.create!(name: Faker::Name.name, party: parties.sample, api_key: SecureRandom.uuid)
end

10.times do
  Seat.create(name: Faker::Commerce.department )
end

20.times do
  seats = Seat.all
  Candidate.create(name: Faker::Company.name, seat: seats.sample)
end

Voter.all.each do |voter|
  Candidate.all.each do |candidate|
    seat = candidate.seat
    Vote.create(voter: voter, seat: seat, candidate: candidate)
  end
end
