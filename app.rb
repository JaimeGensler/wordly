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
get '/words/:id' do
    @page_name = 'View'
    @word = Word.search(params[:id].to_i)
    @word_defs = Definition.for(params[:id].to_i)
    erb :words_ID
end
get '/words/:id/edit' do
    @page_name = 'View'
    @word = Word.search(params[:id].to_i)
    erb :words_ID_edit
end


post '/words' do
    new_word = Word.new(params)
    params[:word_id] = new_word.id
    Definition.new(params)
    redirect to '/words'
end
patch('/words/:id') do
    Word.search(params[:id].to_i).update(params)
    redirect to "/words/#{params[:id]}"
end
delete('/words/:id') do
    Word.search(params[:id].to_i).delete
    redirect to '/words'
end
