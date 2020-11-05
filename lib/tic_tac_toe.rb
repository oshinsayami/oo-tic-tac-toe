class TicTacToe

    WIN_COMBINATIONS= [
        [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]
        ]

    def initialize (board=nil)
        @board = board || Array.new(9, " ")
    end
   
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(index, player)
        @board[index] = player
    end

    def position_taken?(position)
        ((@board[position] == "X") || (@board[position] == "O"))
    end

    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
    end

    def turn_count
        count=0
        @board.each do |i|
            if (i == "X" || i == "O")
                count+=1
            end
        end
        return count
    end

    def current_player
        if turn_count % 2 == 0
            "X"
        else
            "O"
        end
    end

    def turn
        input = gets.strip
        index= input_to_index(input)
        char = current_player
        if valid_move?(index)
            move(index,char)
            display_board
        else
            turn
        end
    end

    def won?
        WIN_COMBINATIONS.detect do |winner|
            if (@board[winner[0]] == "X" && @board[winner[1]] == "X" && @board[winner[2]] == "X")
                return winner
            elsif (@board[winner[0]] == "O" && @board[winner[1]] == "O" && @board[winner[2]] == "O")
                return winner
            end
            false
        end
    end

    def full?
        @board.all?{|occupied| occupied !=" "}
    end

    def draw?
        !(won?) && (full?)
    end

    def over?
        won? || full? || draw?
    end

    def winner
        WIN_COMBINATIONS.detect do |winner|
            if (@board[winner[0]] == "X" && @board[winner[1]] == "X" && @board[winner[2]] == "X")
                return "X"
            elsif (@board[winner[0]] == "O" && @board[winner[1]] == "O" && @board[winner[2]] == "O")
                return "O"
            end
            
        end
    end

    def play
        while over? == false
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end

end