json.array!(@holes) do |hole|
  json.extract! hole, :id, :number, :course_id
  json.url hole_url(hole, format: :json)
end
