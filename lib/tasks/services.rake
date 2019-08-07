namespace :services do

  task :emit => :environment do
    Account.all.each do |account|
      next unless Date.current.yday % account.post_frequency == 0

      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
        config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
        config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
        config.access_token_secret = ENV["TWITTER_ACCESS_SECRET"]
      end

      item = Item.where(active: true).order("latest_published_at ASC NULLS FIRST").first

      tweet = client.update(item.text)

      item.posts.create(
        published_at: Time.current,
        platform_post_id: tweet.id,
        text: item.text
      )
      item.update(
        latest_published_at: Time.current
      )
    end
  end

end
