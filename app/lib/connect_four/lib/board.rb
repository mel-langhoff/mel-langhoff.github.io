class Board
    attr_accessor :board

    def initialize
        @board = board
    end

    def create_board
        @board = Array.new(6) {Array.new(7, Cell.new.cell_value)}
    end

    def display_board
        puts "ABCDEFG"
        @board.each do |row|
            row.each {|cell| print "#{cell}"}
            print "\n"
        end 
    end
end
