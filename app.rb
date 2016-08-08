require 'sinatra'
require 'json'

get '/' do
  'Hello,World!'
end

get '/hi' do
  'Hi'
end

post '/hi' do

  j = JSON.parse(request.body.string)
  j['events'].select{|e| e['message']}.map{|e|
    if e['message']['text'] == "hi" then
      "Hi, #{e["message"]["nickname"]}!"
      else
      ""
    end
  }
end
