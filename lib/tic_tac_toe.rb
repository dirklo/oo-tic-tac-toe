class TicTacToe
    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]

    def initialize
        @board = Array.new(9, " ")
    end

    attr_accessor :board

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

    def move(index, token="X")
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] == " " ? false : true
    end    
    
    def valid_move?(index)
        !position_taken?(index) && index >= 0 && index < 9 ? true : false
    end
    
    def turn_count
        @board.filter{|space| space != " "}.length       
    end
    
    def current_player
        turn_count == 0 || turn_count % 2 == 0 ? "X" : "O"   
    end

    def turn
        loop do
            puts "Please place a piece, Select 1-9"
            index = input_to_index(gets.chomp)
            if valid_move?(index)
                @board[index] = current_player()
                display_board()
                break
            end
            puts "Invalid input, try again"       
        end
    end
    
    def won?
        token = false
        WIN_COMBINATIONS.each do |combo|
            if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && @board[combo[0]] != " "
                token = combo
            end
        end 
        token 
    end

    def winner
        token = nil
        token = @board[won?[0]] if won? != false
        token
    end
    
    def full?
        @board.all? {|spot| spot != " " ? true : false}
    end

    def draw?
        full? && !won? ? true : false
    end
    
    def over?
        draw? || won? ? true : false
    end       
    
    def play
        turn while !over?
        if won?
            puts "Congratulations #{winner}!"
        end 
        if draw?
            puts "Cat's Game!"
        end
    end  
end            