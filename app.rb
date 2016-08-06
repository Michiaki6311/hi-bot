require 'sinatra'
require 'json'

get '/' do
  "Hello,World!"
end

get "/hi" do
  "hi with your name"
end

post '/hi' do
  content_type :text
  j = JSON.parse(request.body.string)
  j["events"].select{|e|e['message']}.map{|e|
    text = e["message"]["text"]
    if text == hi
      result = "Hi,#{e["message"]["nickname"]}!"
      if result .empty?
        return "Not Found."
      else
        return result
      end
    end
  }
  return ""
end
