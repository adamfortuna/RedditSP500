require 'csv'
require 'json'
require 'httparty'

url = 'https://www.reddit.com/r/financialindependence/comments/fwnrpt.json'
response = HTTParty.get(url, headers: {'User-agent': 'FI S&P 500 Analyzer'})
data = JSON.load response.body


top_level_comments = data[1]['data']['children']
puts "Top level comments: #{top_level_comments.length}"

CSV.open('results.csv', 'wb') do |csv|
  csv << ["date", "guess", "author", "permalink"]
  top_level_comments.each do |full_comment|
    comment_data = full_comment['data']
    comment = comment_data['body']

    if comment && (match = comment.match(/([\d|,|\.]){3,}/)) && !match.nil?
      guessed_amount_as_number = match[0].gsub(',', '').to_f
      if guessed_amount_as_number > 0.01 && guessed_amount_as_number < 100000
        csv << [comment_data['created_utc'],
                guessed_amount_as_number,
                comment_data['author'],
                "https://reddit.com#{comment_data['permalink']}"
              ]
      end
    end
  end
end

puts "Created file results.csv with all guesses that contained a guess of at least $0.01 and less than $100,000."
