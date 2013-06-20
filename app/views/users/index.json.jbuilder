json.array!(@users) do |user|
  json.extract! user, :username, :first_name, :last_name, :description, :email
  json.url user_url(user, format: :json)
end