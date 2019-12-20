class Word
    attr_accessor :word
    attr_reader :id
    def initialize (attributes)
        @word = attributes[:word]
        @id = (@@current_id += 1)

        save
    end

    #class methods
    @@words = {}
    @@current_id = 0
    def self.all
        @@words.values
    end
    def self.clear
        @@words = {}
    end

    private
    def save
        @@words[@id] = self
    end
end
