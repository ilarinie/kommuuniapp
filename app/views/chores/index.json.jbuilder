json.array!(@chores) do |chore|
  json.extract! chore, :id
  json.url chore_url(chore, format: :json)
end
