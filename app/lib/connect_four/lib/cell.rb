class Cell
    attr_accessor :cell_value

    def initialize
        @cell_value = "."
    end

    def cell_empty?
       @cell_value == "." ? true : false
    end
end