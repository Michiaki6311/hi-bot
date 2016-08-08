require 'sinatra'
require 'json'

get '/' do
  'Hello,World!'
end

get '/hi' do
  'Hi'
end

post '/hi' do
  content_type :text
  response = ""

  j = JSON.parse(request.body.string)
  j['events'].select{|e| e['message']}.map{|e|
    if e['message']['text'] == "hi" then
      "Hi"
    end
  }
    response.strip
end
