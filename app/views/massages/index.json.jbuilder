json.array!(@massages) do |massage|
  json.extract! massage, :title, :content, :user_id, :receiver_id
  json.url massage_url(massage, format: :json)
end