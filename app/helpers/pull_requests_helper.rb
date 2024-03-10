module PullRequestsHelper
  def category_select_options(selected:)
    options_from_collection_for_select(Category.all, 'id', 'name', selected)
  end 

  def pull_request_sort_select_options(selected:)
    options_for_select([
      ["Date", "merged_at"],
      ["Test Priority", "test_priority"],
      ["Category", "category"]
    ], selected)
  end
end
