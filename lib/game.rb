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

  def show_player_move(player_move, all_lines_field)

    @player_moves << player_move

    l2 = all_lines_field[2].sub(player_move.to_s, "X")
    l6 = all_lines_field[6].sub(player_move.to_s, "X")
    l10 = all_lines_field[10].sub(player_move.to_s, "X")
    all_lines_field[2] = l2
    all_lines_field[6] = l6
    all_lines_field[10] = l10

    field_new = Array.new(all_lines_field)
    line2 = field_new[2].sub(player_move.to_s, 'X').gsub(/[123]/, ' ')
    line6 = field_new[6].sub(player_move.to_s, 'X').gsub(/[456]/, ' ')
    line10 = field_new[10].sub(player_move.to_s, 'X').gsub(/[789]/, ' ')
    field_new[2] = line2
    field_new[6] = line6
    field_new[10] = line10

    puts field_new
  end

  def show_comp_move(comp_move, all_lines_field)

    @comp_moves << comp_move

    l2 = all_lines_field[2].sub(comp_move.to_s, "O")
    l6 = all_lines_field[6].sub(comp_move.to_s, "O")
    l10 = all_lines_field[10].sub(comp_move.to_s, "O")
    all_lines_field[2] = l2
    all_lines_field[6] = l6
    all_lines_field[10] = l10

    field_new = Array.new(all_lines_field)
    line2 = field_new[2].sub(comp_move.to_s, 'O').gsub(/[123]/, ' ')
    line6 = field_new[6].sub(comp_move.to_s, 'O').gsub(/[456]/, ' ')
    line10 = field_new[10].sub(comp_move.to_s, 'O').gsub(/[789]/, ' ')
    field_new[2] = line2
    field_new[6] = line6
    field_new[10] = line10

    puts field_new
  end

  def player_won?
    POSITIONS_WINS.each do |win|
      if win - @player_moves.sort == []
        puts "Вы выиграли!"
        abort
      end
    end
  end

  def comp_won?
    POSITIONS_WINS.each do |win|
      if win - @comp_moves.sort == []
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
