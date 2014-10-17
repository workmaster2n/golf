json.array!(@games) do |game|
  json.extract! game, :id, :course_id, :played_on
  json.url game_url(game, format: :json)
end
