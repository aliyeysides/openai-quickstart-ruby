require 'sinatra'
require 'dotenv/load'
require 'sinatra/reloader' if ENV['APP_ENV'] == 'development'
require 'ruby/openai'

set :public_folder, 'public'

client = OpenAI::Client.new

def generate_prompt(animal)
  "Suggest three names for an animal that is a superhero.

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
  response = client.completions(engine: 'text-davinci-002',
                                parameters: { prompt: generate_prompt(params[:animal]),
                                              temperature: 0.6 })
  @result = response.parsed_response['choices'].map { |c| c['text'] }.join(',')
  erb :index, locals: { result: @result }
end
