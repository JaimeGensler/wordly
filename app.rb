require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require './lib/word'
require './lib/definition'
also_reload 'lib/**/*.rb'

get '/' do
    erb :home
end

get '/words' do
    @words = Word.all
    erb :words
end

get '/words/create' do
    erb :words_create
end

post '/words' do
    Word.new(params)
    Definition.new(params)
    redirect to '/words'
end
