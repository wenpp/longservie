json.array!(@stock_messages) do |stock_message|
  json.extract! stock_message, :id, :message
  json.url stock_message_url(stock_message, format: :json)
end
