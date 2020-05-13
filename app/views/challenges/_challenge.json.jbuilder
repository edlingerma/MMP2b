json.extract! challenge, :id, :title, :description, :created_at, :updated_at
json.owner challenge.owner.username

json.activities(challenge.activities) do |activity|
  json.title activity.title
  json.description activity.description
  json.goal activity.goal
  json.unit activity.unit
end

json.url challenge_url(challenge, format: :json)
