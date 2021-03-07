require './lib/connect_four.rb'

describe Game do

    describe '#check_for_winner' do
        it "Checks to see if there is a horizontal winner in column 1 with X winning" do
            game = Game.new()
            game.board[0] = ['X', 'X', 'X', 'X', ' ', ' ']
            result = game.check_for_winner
            expect(result).to be true
        end
    end

    describe '#check_for_winner2' do
        it "Checks to see if there is a vertical winner with X winning" do
            game = Game.new()
            game.board[1][1] = 'X'
            game.board[2][1] = 'X'
            game.board[3][1] = 'X'
            game.board[4][1] = 'X'
            result = game.check_for_winner
            expect(result).to be true
        end
    end

    describe '#check_for_winner3' do
        it "Checks for positively sloped winner" do
            game = Game.new()
            game.board = [ 
            [" ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", "X", " ", " "],
            [" ", " ", " ", "X", " ", " ", " "],
            [" ", " ", "X", " ", " ", " ", " "],
            [" ", "X", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " "]]
            result = game.check_for_winner
            expect(result).to be true
        end
    end

    describe '#check_for_winner4' do
        it "Checks for negative sloped winner" do
        game = Game.new()
            game.board = [ 
            [" ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " "],
            [" ", "X", " ", " ", " ", " ", " "],
            [" ", " ", "X", " ", " ", " ", " "],
            [" ", " ", " ", "X", " ", " ", " "],
            [" ", " ", " ", " ", "X", " ", " "]]
            result = game.check_for_winner
            expect(result).to be true
        end
    end
        
end