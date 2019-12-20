require 'rspec'
require 'word'

describe 'Word' do
    before :each do
        @word1 = Word.new({word: 'Coffee'})
        @word2 = Word.new({word: 'Magnanimous'})
        @word3 = Word.new({word: 'Program'})
    end

    describe '#save' do
        it 'saves the word' do
            word = Word.new('Resting').save
            expect(Word.all).to include(word)
        end
    end
    describe '#initialize' do
        it 'instantiates a new object with unique ID' do
            expect(word.word).to eq('Testing')
            expect(word.id).to eq(4)
        end
    end
    describe '.all' do
        it 'returns an array of all words' do
            expect(Word.all).to eq ([@word1, @word2, @word3])
        end
    end
end
