json.array!(@golfers) do |golfer|
  json.extract! golfer, :id, :name, :birthday
  json.url golfer_url(golfer, format: :json)
end
