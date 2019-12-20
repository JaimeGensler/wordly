require 'rspec'
require 'definition'

describe 'Definition' do
    before :each do
        #word_id 1 is "Program"
        #word_id 2 is "Humongous"
        Definition.clear
        @def1 = Definition.new({definition: 'A set of related measures or activities with a particular long-term aim', part_of_speech: 'noun', word_id: 1})
        @def2 = Definition.new({definition: 'Huge; enormous.', word_id: 2})
        @def3 = Definition.new({definition: 'To provide (a computer or other machine) with coded instructions for the automatic performance of a task.', part_of_speech: 'verb', word_id: 1})
    end

    describe '#save' do
        it 'saves the definition when initialized' do
            def0 = Definition.new({definition: 'Resting'}) #save is run at the end of initialize
            expect(Definition.all).to include(def0)
        end
    end
    describe '#update' do
        it 'updates the attributes of a Word' do
            @def1.update({definition: 'Some actions with a goal', part_of_speech: 'adjective'})
            expect(@def1.definition).to eq('Some actions with a goal')
        end
    end
    describe '#delete' do
        it 'removes a word from the list' do
            @def1.delete
            expect(Definition.all).to eq([@def2, @def3])
        end
    end

    describe '.all' do
        it 'returns an array of all definitions' do
            expect(Definition.all).to eq([@def1, @def2, @def3])
        end
    end
    describe '.clear' do
        it 'clears all definitions' do
            Definition.clear
            expect(Definition.all).to eq([])
        end
    end
end
