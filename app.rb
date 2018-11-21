require 'sinatra/base'
require 'yaml'
require 'erb'


class App < Sinatra::Base
  before do
    @game = YAML.load_file('./game.yml')
  end

  get '/' do
    @categories = @game['tiles'].keys
    erb :'index.html', layout: :'layout.html'
  end

  get '/questions/:key' do |key|
    @question_key = key
    @question = @game['questions'][key]['question']
    erb :'question.html', layout: :'layout.html'
  end

  get '/questions/:key/answer' do |key|
    @question = @game['questions'][key]['question']
    @answer = @game['questions'][key]['answer']
    erb :'answer.html', layout: :'layout.html'
  end
end
