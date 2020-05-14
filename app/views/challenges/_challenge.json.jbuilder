# Impressum
# Copyright by Maria Edlinger, Jonathan Lex and Markus Wallner

json.extract! challenge, :id, :title, :description, :created_at, :updated_at
json.owner challenge.owner.username

json.activities(challenge.activities) do |activity|
  json.title activity.title
  json.description activity.description
  json.goal activity.goal
  json.progress activity.amount
  json.unit activity.unit
end

json.url challenge_url(challenge, format: :json)
