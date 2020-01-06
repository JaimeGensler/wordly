require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require './lib/word'
require './lib/definition'
also_reload 'lib/**/*.rb'

get '/' do
    @page_name = 'Words'
    @words = Word.all
    erb :words
end

get '/words' do
    @page_name = 'Words'
    @words = Word.all
    erb :words
end

get '/words/new' do
    @page_name = 'New Word'
    erb :words_new
end

post '/words' do
    Word.new(params)
    Definition.new(params)
    redirect to '/words'
end
