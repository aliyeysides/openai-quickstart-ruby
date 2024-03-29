require 'sinatra'
require 'dotenv/load'
require 'sinatra/reloader' if ENV['APP_ENV'] == 'development'
require 'ruby/openai'

set :public_folder, 'public'

client = OpenAI::Client.new(access_token: ENV.fetch('OPENAI_ACCESS_TOKEN'))

def generate_prompt(animal)
  "Suggest three names for an animal that is a superhero separated by commas.

    Animal: Cat
    Names: Captain Sharpclaw, Agent Fluffball, The Incredible Feline
    Animal: Dog
    Names: Ruff the Protector, Wonder Canine, Sir Barks-a-Lot
    Animal: #{animal}
    Names:"
end

get '/' do
  erb :index
end

post '/' do
  response = client.chat(
    parameters: {
      model: 'gpt-3.5-turbo',
      messages: [
        {"role": "system", "content": "You are a helpful assistant."},
        {"role": "user", "content": generate_prompt(params[:animal])}
      ],
      temperature: 0.6 
    }
  )
  @result = response.dig('choices',0,'message','content')

  erb :index, locals: { result: @result }
end
