class Category < ApplicationRecord
  default_scope { order('lower(name)') }

  has_many :pull_request
end
