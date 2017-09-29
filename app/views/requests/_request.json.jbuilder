json.extract! request, :id, :artist, :title, :comments, :created_at, :updated_at
json.url request_url(request, format: :json)
