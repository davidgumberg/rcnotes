require "test_helper"

class PullRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pull_request = pull_requests(:one)
  end

  test "should get index" do
    get pull_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_pull_request_url
    assert_response :success
  end

  test "should create pull_request" do
    assert_difference("PullRequest.count") do
      post pull_requests_url, params: { pull_request: { category_id: @pull_request.category_id, merged_at: @pull_request.merged_at, notes: @pull_request.notes, num: @pull_request.num, repository: @pull_request.repository, title: @pull_request.title, url: @pull_request.url } }
    end

    assert_redirected_to pull_request_url(PullRequest.last)
  end

  test "should show pull_request" do
    get pull_request_url(@pull_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_pull_request_url(@pull_request)
    assert_response :success
  end

  test "should update pull_request" do
    patch pull_request_url(@pull_request), params: { pull_request: { category_id: @pull_request.category_id, merged_at: @pull_request.merged_at, notes: @pull_request.notes, num: @pull_request.num, repository: @pull_request.repository, title: @pull_request.title, url: @pull_request.url } }
    assert_redirected_to pull_request_url(@pull_request)
  end

  test "should destroy pull_request" do
    assert_difference("PullRequest.count", -1) do
      delete pull_request_url(@pull_request)
    end

    assert_redirected_to pull_requests_url
  end
end
