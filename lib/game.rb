class Game
  def initialize
    # Массив для записи ходов юзера
    @player_moves = []
    # Массив для записи ходов компьютера
    @comp_moves = []
  end

  # хеш всех ходов для проверки пользователя.
  ALL_MOVES = {1 => "x1 y1", 2 => "x2 y1", 3 => "x3 y1", 4 => "x1 y2", 5 => "x2 y2",
               6 => "x3 y2", 7 => "x1 y3", 8 => "x2 y3", 9 => "x3 y3"}
  # Массив с выигрышными комбинациями
  POSITIONS_WINS = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

  def add_player_move(player_move)
    @player_moves << player_move
  end

  def add_comp_move(comp_move)
    @comp_moves << comp_move
  end

  def player_won?(player_moves)
    POSITIONS_WINS.each do |win|
      if win - player_moves == []
        puts "Вы выиграли!"
        abort
      end
    end
  end

  def comp_won?(comp_moves)
    POSITIONS_WINS.each do |win|
      if win - comp_moves == []
        puts "Выиграл компьютер."
        abort
      end
    end
  end

  # гетеры
  def all_moves
    ALL_MOVES
  end

  def player_moves
    @player_moves
  end

  def comp_moves
    @comp_moves
  end
end # Финал класса
