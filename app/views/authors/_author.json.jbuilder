json.extract! author, :id, :firstname, :lastname, :artist_name, :created_at, :updated_at
json.url author_url(author, format: :json)
