json.extract! pull_request, :id, :num, :url, :title, :repository, :notes, :category_id, :merged_at, :created_at, :updated_at
json.url pull_request_url(pull_request, format: :json)
