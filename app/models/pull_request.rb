# frozen_string_literal: true

class PullRequest < ApplicationRecord
  enum :test_priority, [ :unknown, :no, :maybe, :yes ], default: :unknown

  belongs_to :category
  has_markdown :notes

  before_validation :set_nil_category, unless: -> { category.present? }

  def set_nil_category
    self.category = Category.find_or_create_by(name: "")
  end

  # Returns a `PullRequest` object from a pr #
  # Expects PR to be merged.
  def self.from_number(number:, repository: "bitcoin/bitcoin")
    gh_client = Octokit::Client.new(access_token: Rails.application.credentials.github_oauth_key)
    octo_pr = gh_client.pull_request(repository, number)

    new(
      number:,
      repository:,
      url: octo_pr.html_url,
      title: octo_pr.title,
      merged_at: octo_pr.merged_at
    )
  end

  def sort(sort:, order:)
    
  end
end
