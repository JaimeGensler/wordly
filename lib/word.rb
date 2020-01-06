class Word
    attr_accessor :word
    attr_reader :id
    def initialize (attributes)
        @word = attributes[:word]
        @id = (@@current_id += 1)
        save
    end
    def update (update_attributes)
        @word = update_attributes[:word]
    end
    def delete
        @@words.delete(@id)
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
    def self.search(id)
        @@words[id]
    end

    private
    def save
        @@words[@id] = self
    end
end
