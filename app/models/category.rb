class Category < ApplicationRecord
  default_scope { order('lower(name)') }

  has_many :pull_request

  def pretty_name
    if name == ""
      "Uncategorized"
    else
      name
    end
  end
end
