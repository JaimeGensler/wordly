class Definition
    attr_accessor :def, :word_id
    attr_reader :def_id
    def initialize (attributes)
        @definition = attributes[:definition]
        @part_of_speech = attributes[:part_of_speech]
        @word_id = attributes[:word_id]
        @def_id = (@@current_id += 1)

        save
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

    private
    def save
        @@definitions[@def_id] = self
    end
end
