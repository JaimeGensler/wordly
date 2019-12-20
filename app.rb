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
    word = Word.new({word: 'test'})
    @words = Word.all
    erb :words
end

get '/words/create' do
    erb :words_create
end
