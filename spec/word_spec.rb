require 'rspec'
require 'word'

describe 'Word' do
    before(:each) do
        @word1 = Word.new({word: "Coffee"})
    end

    describe('#initialize') do
        it("instantiates a new object with unique ID") do
            expect(@word1.word).to(eq("Coffee"))
            expect(@word1.id).to(eq(1))
        end
    end
end
