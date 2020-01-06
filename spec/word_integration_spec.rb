require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'create a word path', {:type => :feature} do
    it 'creates a word and checks it populates main page' do
        visit('/words')
        click_on('+')
        fill_in('word', :with => 'Spaghetti')
        click_on('Add Word!')
        expect(page).to have_content('Spaghetti')
    end
end

describe 'update a word path', {:type => :feature} do
    it 'updates a word and redirects to that word page' do
        word = Word.new({word: "Spaghetti"})
        visit("/words/#{word.id}")
        click_on("Edit/Delete Word")
        fill_in('word', :with => 'Linguine')
        click_on('Update!')
        expect(page).to have_content('Linguine')
    end
end

describe 'delete a word path', {:type => :feature} do
    it 'deletes a word and redirects to all words page' do
        Word.clear
        word = Word.new({word: "Spaghetti"})
        visit("/words/#{word.id}/edit")
        click_on('Delete Word')
        expect(page).not_to have_content('Spaghetti')
    end
end
