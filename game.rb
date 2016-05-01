class Game
  def initialize
    # Объявляю пустой массив для записи в него всех строк файла
    @all_lines_field = []
    # Массив для записи ходов юзера
    @player_moves = []
    # Массив для записи ходов компьютера
    @comp_moves = []
    # хеш всех ходов для проверки пользователя.
    @all_moves = {1 => "x1 y1", 2 => "x2 y1", 3 =>"x3 y1", 4 => "x1 y2", 5 => "x2 y2",
                 6 => "x3 y2", 7 => "x1 y3", 8 => "x2 y3", 9 => "x3 y3"}
    # хеш с выигрышными комбинациями
    @positions_wins = {1=> [1,2,3], 2=> [4,5,6], 3=> [7,8,9], 4=> [1,4,7],
                      5=> [2,5,8], 6=> [3,6,9], 7=> [1,5,9], 8=> [3,5,7]}
  end

  # Метод хранящий игровое поле и поле, для красоты выводимое на экран
  def field
    # Путь к файлу
    current_path = File.dirname(__FILE__)
    # Имя файла
    p_f = current_path + '/files_txt/playing_field.txt'
    # Проверка на существование файла
    if File.exist?(p_f)
      # Открываю файл
      playing_field = File.open(p_f, "r:UTF-8")
      # Записываю построчно файл в массив
      @all_lines_field = playing_field.readlines
      # Закрываю файл
      playing_field.close
      # Возвращаю наглядное поле
      # Создаю клон поля и удаляю из него все #
      clone_all_lines = @all_lines_field.clone
      line2 = clone_all_lines[2].gsub(/[123]/, ' ')
      clone_all_lines[2] = line2

      line6 = clone_all_lines[6].gsub(/[456]/, ' ')
      clone_all_lines[6] = line6

      line10 = clone_all_lines[10].gsub(/[789]/, ' ')
      clone_all_lines[10] = line10
      # Вывожу поле без # на экран
      puts clone_all_lines
    else
      puts 'Файл не найден.'
    end
  end # Финал метода field

  def move_player(move_player)

    @player_moves << move_player

    l2 = @all_lines_field[2].sub(move_player.to_s, "X")
    l6 = @all_lines_field[6].sub(move_player.to_s, "X")
    l10 = @all_lines_field[10].sub(move_player.to_s, "X")
    @all_lines_field[2] = l2
    @all_lines_field[6] = l6
    @all_lines_field[10] = l10

    field_new = Array.new(@all_lines_field)
    line2 = field_new[2].sub(move_player.to_s, 'X').gsub(/[123]/, ' ')
    line6 = field_new[6].sub(move_player.to_s, 'X').gsub(/[456]/, ' ')
    line10 = field_new[10].sub(move_player.to_s, 'X').gsub(/[789]/, ' ')
    field_new[2] = line2
    field_new[6] = line6
    field_new[10] = line10

    puts field_new
  end

  def move_comp(move_comp)

    @comp_moves << move_comp

    l2 = @all_lines_field[2].sub(move_comp.to_s, "O")
    l6 = @all_lines_field[6].sub(move_comp.to_s, "O")
    l10 = @all_lines_field[10].sub(move_comp.to_s, "O")
    @all_lines_field[2] = l2
    @all_lines_field[6] = l6
    @all_lines_field[10] = l10

    field_new = Array.new(@all_lines_field)
    line2 = field_new[2].sub(move_comp.to_s, 'O').gsub(/[123]/, ' ')
    line6 = field_new[6].sub(move_comp.to_s, 'O').gsub(/[456]/, ' ')
    line10 = field_new[10].sub(move_comp.to_s, 'O').gsub(/[789]/, ' ')
    field_new[2] = line2
    field_new[6] = line6
    field_new[10] = line10

    puts field_new
  end
  # Метод показывает варианты выигрыша
  def win(comp_or_player)
    # Прохожусь по выигрышным массивам
    @positions_wins.each_value do |win|
      # Если вместо атрибута метода будет выбран, массив ходов юзера
      # и если одно из значений(массив выигрышных комбинаций) минус
      # @player_moves будет равно []
      if comp_or_player == @player_moves &&
          win - comp_or_player == []
        puts "Вы выиграли!"
        abort

      elsif comp_or_player == @comp_moves &&
          win - comp_or_player == []
        puts "Выиграл компьютер."
        abort
      end
    end
  end
  # гетеры
  def all_moves
    @all_moves
  end

  def player_moves
    @player_moves
  end

  def comp_moves
    @comp_moves
  end
end # Финал класса
