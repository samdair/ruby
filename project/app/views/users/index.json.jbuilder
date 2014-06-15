json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :hashed_password, :admin
  json.url user_url(user, format: :json)
end
