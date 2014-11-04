json.array!(@voters) do |voter|
  json.extract! voter, :id, :name, :email, :city, :state
  json.url voter_url(voter, format: :json)
end
