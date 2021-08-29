json.extract! comment, :id, :comment_by, :comment_text, :created_at, :updated_at
json.url comment_url(comment, format: :json)
