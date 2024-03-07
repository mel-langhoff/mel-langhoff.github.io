class Game
    attr_reader :board, 
                :current_player,
                :player_1,
                :player_2
    
    def initialize
        @board = Board.new
        @player_1 = Player.new("Person", "X")
        @player_2 = Player.new("Computer", "O")
        @current_player = @player_1
    end

    def game_menu
        puts """\n\n#{"=" * 15} Welcome to Connect Four! #{"=" * 15}\n
        Type \"play\" to begin or \"quit\" to exit\n\n\n"""

        loop do
            case gets.strip.downcase
            when "play"
                start_game
                break
            when "quit"
                exit
            else
                puts "Invalid input: Please type \"play\" to begin game or \"quit\" to exit\n\n"
            end
        end
    end

    def start_game
        
        puts """\nHow to Play: Opponents take turns dropping their token (\"X\" or \"O\") into one of the columnns A-G. The first player to connect 4 of their tokens in a horizontal, vertical, or diagonal line wins! \n
        #{@player_1.player_name} is X's
        #{@player_2.player_name} is O's\n\n"""

        @board.create_board
        @board.display_board
        take_turn
    end

    def take_turn
        print "\nType column name (A-G) to place token: " unless @current_player.player_name == "Computer"
        if @current_player.player_name == "Computer"
            computer_column_options = ["A", "B", "C", "D", "E", "F", "G"]
            current_player_input = computer_column_options.sample
            valid_column?(current_player_input)
        else
            current_player_input = gets.strip.upcase
            valid_column?(current_player_input)
        end
    end

    def valid_column?(current_player_input)
        if ("A".."G").include?(current_player_input)
            column_full?(current_player_input)
        else
            print "Invalid column name: " unless @current_player.player_name == "Computer"
            take_turn
        end
    end

    def column_full?(current_player_input)
        column_number = current_player_input.ord - "A".ord
        columned_board = @board.board.transpose
        if columned_board[column_number].include?(".")
            puts "\nType column name (A-G) to place token: #{current_player_input}" if @current_player.player_name == "Computer"
            place_token(current_player_input)
        else
            print "Column full: " unless @current_player.player_name == "Computer"
            take_turn
        end
    end

    def place_token(current_player_input)
        column_number = current_player_input.ord - "A".ord
        columned_board = @board.board.transpose
        last_empty_cell_position = columned_board[column_number].rindex(".")
        columned_board[column_number][last_empty_cell_position] = @current_player.token
        @board.board = columned_board.transpose
        @board.display_board
        game_over?
    end

    def game_over?
        if tie_game? || vertical_win? || horizontal_win? || diagonal_win?
            end_game
        else
            change_player
        end
    end

    def end_game
        if tie_game?
            print "It's a draw! Better luck next time. "
            play_again
        else 
            print "Congratulations! #{@current_player.player_name} wins! "
            play_again
        end
    end

    def play_again
        puts "Play again? Type YES or NO"
        input = gets.strip.upcase
        if input == "YES"
            Game.new
            @current_player = @player_1
            game_menu
        elsif input == "NO"
            puts "Goodbye!"
            exit
        else
            print "Invalid option: "
            play_again
        end
    end
        
    def tie_game?
        @board.board.each do |row|
            return false if row.any? {|cell| cell == "."}
        end
        true
    end

    def horizontal_win?
        @board.board.each do |row|
            row.each_cons(4) do |tokens|
                return true if tokens.all? do |token|
                    token == @current_player.token
                end
            end
        end
        false
    end

    def vertical_win?
        @board.board.transpose.each do |column|
            column.each_cons(4) do |tokens|
                return true if tokens.all? do |token|
                    token == @current_player.token
                end
            end
        end
        false
    end

    def diagonal_win?
        return true if top_left_to_bottom_right? || top_right_to_bottom_left?
        false
    end

    def top_left_to_bottom_right?
        #6 rows, 7 columns
        rows = @board.board.size
        columns = @board.board.first.size
        (0..rows - 4).each do |row|
            (0..columns - 4).each do |column|
                return true if (0..3).all? {|num| @board.board[row + num][column + num] == @current_player.token }
            end
        end
        false
    end

    def top_right_to_bottom_left?
        rows = @board.board.size
        columns = @board.board.first.size
        (0..rows - 4).each do |row|
            (3..columns - 1).each do |column|
                return true if (0..3).all? {|num| @board.board[row + num][column - num] == @current_player.token }
            end
        end
        false
    end

    def change_player
        if @current_player == @player_1
            @current_player = @player_2
            take_turn
        else
            @current_player = @player_1
            take_turn
        end
    end
end