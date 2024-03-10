require "application_system_test_case"

class PullRequestsTest < ApplicationSystemTestCase
  setup do
    @pull_request = pull_requests(:one)
  end

  test "visiting the index" do
    visit pull_requests_url
    assert_selector "h1", text: "Pull requests"
  end

  test "should create pull request" do
    visit pull_requests_url
    click_on "New pull request"

    fill_in "Category", with: @pull_request.category_id
    fill_in "Merged at", with: @pull_request.merged_at
    fill_in "Notes", with: @pull_request.notes
    fill_in "Num", with: @pull_request.num
    fill_in "Repository", with: @pull_request.repository
    fill_in "Title", with: @pull_request.title
    fill_in "Url", with: @pull_request.url
    click_on "Create Pull request"

    assert_text "Pull request was successfully created"
    click_on "Back"
  end

  test "should update Pull request" do
    visit pull_request_url(@pull_request)
    click_on "Edit this pull request", match: :first

    fill_in "Category", with: @pull_request.category_id
    fill_in "Merged at", with: @pull_request.merged_at
    fill_in "Notes", with: @pull_request.notes
    fill_in "Num", with: @pull_request.num
    fill_in "Repository", with: @pull_request.repository
    fill_in "Title", with: @pull_request.title
    fill_in "Url", with: @pull_request.url
    click_on "Update Pull request"

    assert_text "Pull request was successfully updated"
    click_on "Back"
  end

  test "should destroy Pull request" do
    visit pull_request_url(@pull_request)
    click_on "Destroy this pull request", match: :first

    assert_text "Pull request was successfully destroyed"
  end
end
