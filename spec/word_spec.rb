require 'rspec'
require 'word'

describe 'Word' do
    before :each do
        Word.clear
        @word1 = Word.new({word: 'Coffee'}).send(:save)
        @word2 = Word.new({word: 'Magnanimous'}).send(:save)
        @word3 = Word.new({word: 'Program'}).send(:save)
    end

    describe '#save' do
        it 'saves the word' do
            word = Word.new({word: 'Resting'}).send(:save)
            expect(Word.all).to include(word)
        end
    end
    describe '#initialize' do
        it 'instantiates a new object with unique ID' do
            expect(@word1.word).to eq('Coffee')
        end
    end
    describe '.all' do
        it 'returns an array of all words' do
            expect(Word.all).to eq([@word1, @word2, @word3])
        end
    end
    describe '.clear' do
        it 'clears all words' do
            Word.clear
            expect(Word.all).to eq([])
        end
    end
end
