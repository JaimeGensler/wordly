class Word
    attr_accessor :word
    attr_reader :id
    @@words = {}
    @@current_id = 0
    def initialize (attributes)
        @word = attributes[:word]
        @id = (@@current_id += 1)
    end
end
