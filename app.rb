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
    unless (params[:definition].empty?)
        params[:word_id] = new_word.id
        Definition.new(params)
    end
    redirect to '/words'
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
patch '/words/:id' do
    Word.search(params[:id].to_i).update(params)
    redirect to "/words/#{params[:id]}"
end
delete '/words/:id' do
    Word.search(params[:id].to_i).delete
    redirect to "/words"
end


get '/words/:id/definitions/:def_id' do
    @page_name = 'View'
    @word = Word.search(params[:id].to_i)
    @definition = Definition.search(params[:def_id].to_i)
    erb :words_ID_definitions_DEFID
end
post '/words/:id/definitions' do
    word_id = params[:id]
    params[:word_id] = word_id.to_i
    Definition.new(params)
    redirect to "/words/#{params[:id]}"
end
patch '/words/:id/definitions/:def_id' do
    Definition.search(params[:def_id].to_i).update(params)
    redirect to "/words/#{params[:id]}"
end
delete '/words/:id/definitions/:def_id' do
    Definition.search(params[:def_id].to_i).delete
    redirect to "/words/#{params[:id]}"
end
