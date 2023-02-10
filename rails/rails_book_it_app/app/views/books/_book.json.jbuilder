json.extract! book, :id, :title, :summary, :published_date, :image_path, :created_at, :updated_at
json.url book_url(book, format: :json)
