module Common
  extend ActiveSupport::Concern

  require "net/http"
  require "uri"
  require "json"

  def calc_youtube(site_url)
    user_name = site_url.gsub(%r"https://www.youtube.com/user/",'')
    my_key = "AIzaSyApEvAcsA4nvb9jEJJHT9exAP361bl7Xx0"
    uri = URI.parse("https://www.googleapis.com/youtube/v3/channels?part=contentDetails&forUsername=#{user_name}&key=#{my_key}")
    response = Net::HTTP.get_response(uri)
    hash = JSON.parse(response.body)
    user_id = hash["items"][0]["id"]
    uri = URI.parse("https://www.googleapis.com/youtube/v3/channels?part=statistics&id=#{user_id}&key=#{my_key}")
    response = Net::HTTP.get_response(uri)
    hash = JSON.parse(response.body)
    p hash["items"][0]["statistics"]["subscriberCount"]
  end

  def calc_Twitch(site_url)
    #まずはidの習得 
    user_name = site_url.gsub(%r"https://www.twitch.tv/",'')
    uri = URI.parse("https://api.twitch.tv/kraken/users?login=#{user_name}")
    request = Net::HTTP::Get.new(uri)
    request["Accept"] = "application/vnd.twitchtv.v5+json"
    request["Client-Id"] = "1fgz97kpcndz401cttl5wq3kafhhwv"
    req_options = {
      use_ssl: uri.scheme == "https",
    }
    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    hash = JSON.parse(response.body)
    user_id = hash["users"][0]["_id"]

    #チャンネル登録者数
    uri = URI.parse("https://api.twitch.tv/kraken/channels/#{user_id}")
    request = Net::HTTP::Get.new(uri)
    request["Accept"] = "application/vnd.twitchtv.v5+json"
    request["Client-Id"] = "1fgz97kpcndz401cttl5wq3kafhhwv"
    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    hash = JSON.parse(response.body)
    @follower = hash["_id"]
    p "#{hash["followers"]}"
    #もし必要になったらputs "All views: #{hash["_id"]}"
  end
end