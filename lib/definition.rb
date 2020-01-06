class Definition
    attr_accessor :definition, :word_id, :part_of_speech
    attr_reader :def_id
    def initialize (attributes)
        @definition = attributes[:definition]
        @part_of_speech = attributes[:part_of_speech]
        @word_id = attributes[:word_id]
        @def_id = (@@current_id += 1)
        save
    end
    def update(update_attributes)
        @definition = update_attributes[:definition]
        @part_of_speech = update_attributes[:part_of_speech]
        @word_id = update_attributes[:word_id]
    end
    def delete
        @@definitions.delete(@def_id)
    end

    #class methods
    @@definitions = {}
    @@current_id = 0
    def self.all
        @@definitions.values
    end
    def self.clear
        @@definitions = {}
    end
    def self.search(id)
        @@definitions[id]
    end
    def self.for(search_id)
        @@definitions.values.select{|elem| elem.word_id == search_id}
    end

    private
    def save
        @@definitions[@def_id] = self
    end
end
