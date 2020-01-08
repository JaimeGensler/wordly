require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'create a definition path', {:type => :feature} do
    it 'creates a definition and checks it populates corresponding word page' do
        visit('/words')
        click_on('+')
        fill_in('word', :with => 'Spaghetti')
        fill_in('definition', :with => 'A type of pasta, frequently served with marinara sauce and meatballs')
        fill_in('part_of_speech', :with => 'noun')
        click_on('Add Word!')
        click_on('View Word')
        expect(page).to have_content('noun')
        expect(page).to have_content('A type of pasta, frequently served with marinara sauce and meatballs')
    end
end
describe 'visit a specific definition', {:type => :feature} do
    it 'is able to visit a specific definitions page' do
        word = Word.new({word: 'Spaghetti'})
        definition = Definition.new({definition: 'Delicious', word_id: word.id})
        visit("/words/#{word.id}/definitions/#{definition.def_id}")
        expect(page).to have_content('Delicious')
    end
end

describe 'update a defition', {:type => :feature} do
    it 'updates a definition and redirects to that definition page' do
        word = Word.new({word: 'Spaghetti'})
        definition = Definition.new({definition: 'Delicious', word_id: word.id})
        visit("/words/#{word.id}/definitions/#{definition.def_id}")
        fill_in('definition', :with => 'Extremely tasty')
        click_on('Update Definition')
        expect(page).to have_content('Extremely tasty')
    end
end

describe 'delete a definition', {:type => :feature} do
    it 'deletes a definition and redirects to word page' do
        word = Word.new({word: 'Spaghetti'})
        definition = Definition.new({definition: 'Delicious', word_id: word.id})
        visit("/words/#{word.id}/definitions/#{definition.def_id}")
        click_on('Delete Definition')
        expect(page).not_to have_content('Delicious')
    end
end
