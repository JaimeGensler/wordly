require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require './lib/word'
require './lib/definition'
also_reload 'lib/**/*.rb'

get '/' do
    redirect to '/words'
end

get '/words' do
    @page_name = 'Words'
    @words = Word.all
    @defs = Definition.all
    erb :words
end

get '/words/new' do
    @page_name = 'New Word'
    erb :words_new
end

post '/words' do
    new_word = Word.new(params)
    params[:word_id] = new_word.id
    Definition.new(params)
    redirect to '/words'
end

get '/words/:id' do
    erb :words_ID
end
