require 'pry'

class Game
    
    attr_accessor :board, :turn, :piece

    def initialize
        @board = Array.new(6) {|i| i = Array.new(7) {|i| i = ' '} } # 6 rows, 7 columns
        @turn = 1
        @piece = "X"
        play
    end

    def play(board = @board)

        print_board

        if @turn == 1
            puts "Player 1's turn"
            @piece = "X"
        else 
            puts "Player 2's turn"
            @piece = 'O'
        end

        puts "Which column do you want to drop your coin into?"
        
        col = gets.to_i - 1
        if col < 0 || col > 5
            puts "That's not a possible column! Pick something between 1 and 6"
            print_board
            play()
        end

        if @board.all? {|row| row[col] != " " } # if every slot in that column is filled up
            puts "That column is filled up! Pick another column"
            print_board
            play()
        end

        # drops the chip into the column
        row = 5 # looks from the bottom up, row 6 is the bottom row which is why we use 5 here for array position
        until board[row][col] == ' ' # looks for the next non-empty spot
            row -= 1
        end

        board[row][col] = @piece

        if check_for_winner
            p "Player #{@turn} wins!"
            print_board
        else
            if @turn == 1
                @turn = 2
            else
                @turn = 1
            end
            play
        end

    end

    # checks if there is a winner
    def check_for_winner(board = @board)

        #horizontal check, will return the symbol
        def four_in_a_row(board)
            board.each do |row|
                a = row.each_cons(4).find {|a| a.uniq.size == 1 && a.first != ' '}
                return true unless a.nil?
            end
            nil
        end
        
        #vertical check
        def four_in_a_column(board)
            four_in_a_row(board.transpose)
        end

        #diagonal check that checks bottom left to top right
        def four_ascending(board)
            result = nil
            for c in 0..3 do
                if result
                    break
                end
                for r in 3..5 do
                    result = board[r][c] == @piece && board[r-1][c+1] == @piece && board[r-2][c+2] == @piece && board[r-3][c+3] == @piece
                    if result
                        break
                    end
                end
            end
            result
        end

        #diagonal check that checks top left to bottom right
        def four_descending(board)
            result = nil
            for c in 0..3 do
                if result
                    break
                end
                for r in 0..2 do
                    result = board[r][c] == @piece && board[r+1][c+1] == @piece && board[r+2][c+2] == @piece && board[r+3][c+3] == @piece
                    if result
                        break
                    end
                end
            end
            result
        end

        four_in_a_row(board) || four_in_a_column(board) || four_ascending(board) || four_descending(board)

    end

    def print_board(board = @board)
        p board[0]
        p board[1]
        p board[2]
        p board[3]
        p board[4]
        p board[5]
    end

end

game = Game.new()