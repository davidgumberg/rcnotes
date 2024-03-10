# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# String of PR's in the rc generated using:
# git log --oneline --merges v26.0..v27.0rc1 | sed -n 's/.*Merge \([^:]*\): \([[:alnum:]]\+\):.*/\1#\2/p; s/.*Merge \([^:]*\):.*/\1 /p'
# E.g.: bitcoin/bitcoin#29546#qt
SEED_PULL_REQUESTS = File.open(Rails.root.join('lib', 'assets', 'seed_merges.txt')) do |file|
  file.each_line(chomp: true) do |line|
    columns = line.split('#')
    pr = PullRequest.from_number(number: columns[1], repository: columns[0])

    # if we have a category
    if columns[2]
      category = Category.find_or_create_by!(name: columns[2])
      pr.category = category
    end

    pr.save!
  end
end
