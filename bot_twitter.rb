require 'twitter'
  ck = ""
  cs = ""
  at = ""
  ats = ""
  client = Twitter::REST::Client.new do |config|
    config.consumer_key = ck
    config.consumer_secret = cs
    config.access_token = at
    config.access_token_secret = ats
  end
  client.update("BORDEEEEEEEEEEEEEEEEEEEEEEEEEEL")
def read_tweets()
   ck = ""
   cs = ""
   at = ""
   ats = ""
# quelques lignes qui enregistrent les clés d'APIs
client = Twitter::Streaming::Client.new do |config|
    config.consumer_key        = ck
      config.consumer_secret     = cs
        config.access_token        = at
          config.access_token_secret = ats
end
p client
# 50.times {|n|
#  client.update("Je le répeterais pas #{n} fois:botter, c\'est mal")
# }
# client.search("to:justinbieber marry me", result_type: "recent").take(3).collect do |tweet|
#    "#{tweet.user.screen_name}: #{tweet.text}"
# end
# topics = ["coffee", "tea"]
# client.filter(track: topics.join(",")) do |object|
#    msg = object.text if object.is_a?(Twitter::Tweet)
#    puts msg
#    sleep_time = 10.0*rand+15
#    sleep(sleep_time)
#    client.update(msg)
# end
=begin File.open("yo.txt", "r") do |f|
    f.each_line do |line|
          puts line
          sleep(5+5.0*rand)
          client.update(line.to_s)
            end
end 
=end
# client.search('#ruby').take(3).each do |tweet|
#    client.update("@#{tweet.user} Hey I love Ruby too, what are your favorite blogs? :)")
# end
x = 0
client.sample do |object|
  x += 1
    msgs =  object.text if object.is_a?(Twitter::Tweet)
   
  #  File.write('tweets.txt', msgs)
   File.open('tweets.txt', 'a') do |f|
        f << msgs
        f << "\n"
    end
    return "stop" if x == 10
end
end
def send_tweets()
    ck = ""
    cs = ""
    at = ""
    ats = ""
  client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ck
        config.consumer_secret     = cs
          config.access_token        = at
            config.access_token_secret = ats
  end
  x = 0
  File.open("tweets.txt", "r") do |f|
    f.each_line do |line|
      x += 1
   #     sleep(3.0*rand)
   line = line.to_s
   line = line.split(" ")
   line = line.to_s
           client.update("#{line}")  # if line.to_s.length < 100
           return "stop" if x == 10
          end
    end 

end

def tweet_alea()
#  File.new("tweets.txt")
#File.delete("tweets.txt")
  read_tweets()
  send_tweets()
end

def copy_tweet()
  ck = ""
   cs = ""
   at = ""
   ats = ""
  client = Twitter::REST::Client.new do |config|
    config.consumer_key = ck
    config.consumer_secret = cs
    config.access_token = at
    config.access_token_secret = ats
  end
  client.search("#coding").take(5).each do |tweet|
    puts "#{tweet.user.screen_name}: #{tweet.text}"
    client.favorite(tweet)
    client.update("@#{tweet.user.screen_name} have published #{tweet.text}. That's AMAZING", in_reply_to_status_id: tweet.id)
 end
end



# copy_tweet()

# tweet_alea
