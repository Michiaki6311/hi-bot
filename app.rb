require 'sinatra'
require 'json'

get '/' do
  "Hello,World!"
end

get "/hi" do
  "hi with your name"
end

post "/hi" do
  j = JSON.parse(request.body.string)
  j["events"].map{ |e|
    if e["message"]
      "Hi, #{e["message"]["nickname"]}!"
    end
  }.compact.join("\n")+"\n"
end
