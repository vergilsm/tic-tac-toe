# gem unicode_utils для преобразования в нижний регистр слова и букв вводимых юзером
require "unicode_utils/downcase"
class Game
  def initialize
    # Объявляю пустой массив для записи в него всех строк файла
    @all_lines_field = []
    # Массив для записи ходов юзера
    @player_moves = []
    # Массив для записи ходов компьютера
    @comp_moves = []
    # Массив для записи ходов игрока-1
    @name1_moves = []
    # Массив для записи ходов игрока-2
    @name2_moves = []
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
      line2 = clone_all_lines[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').gsub(/[23]/, ' ')
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

  # Вариант игры - юзер против компьютера
  def player_vs_comp
    UnicodeUtils.downcase("D")

    # хеш всех ходов для проверки пользователя.
    all_moves = {1 => "x1 y1", 2 => "x2 y1", 3 =>"x3 y1", 4 => "x1 y2", 5 => "x2 y2",
                 6 => "x3 y2", 7 => "x1 y3", 8 => "x2 y3", 9 => "x3 y3"}

    # хеш с выигрышными комбинациями
    positions_wins = {1=> [1,2,3], 2=> [4,5,6], 3=> [7,8,9], 4=> [1,4,7],
                      5=> [2,5,8], 6=> [3,6,9], 7=> [1,5,9], 8=> [3,5,7]}
    # Если пользователь выбрал крестики.
    # Пока юзер не сделал 5 ходов
    while @player_moves.size <= 4
      # Прошу пользователя сделать ход
      puts "\nКак делать ход! Введите (лат.) x1 y1 и Enter\n\nСделайте ваш ход.\n\n"
      move_player = STDIN.gets.chomp.downcase
      # Проверка, чтобы юзер не ввел ерунду
      while !all_moves.value?(move_player) do
        puts "\nСделайте ваш ход. (Как делать ход: x1 y1 и Enter)\n"
        move_player = STDIN.gets.chomp
      end
      # Записываю ход в массив и вывожу игровое поле на экран
      case move_player
        when 'x1 y1'
          @player_moves << 1
          move = @all_lines_field[2].sub('1', 'X')
          @all_lines_field[2] = move

          all_lines_field_new = Array.new(@all_lines_field)
          field_line2 = all_lines_field_new[2].sub('2', ' ').sub('3', ' ')
          field_line6 = all_lines_field_new[6].gsub(/[456]/, ' ')
          field_line10 = all_lines_field_new[10].gsub(/[789]/, ' ')
          all_lines_field_new[2] = field_line2
          all_lines_field_new[6] = field_line6
          all_lines_field_new[10] = field_line10

          puts all_lines_field_new
        when 'x2 y1'
          @player_moves << 2
          move = @all_lines_field[2].sub('2', 'X')
          @all_lines_field[2] = move

          all_lines_field_new = Array.new(@all_lines_field)
          field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').sub('2', 'X').sub('3', ' ')
          field_line6 = all_lines_field_new[6].gsub(/[456]/, ' ')
          field_line10 = all_lines_field_new[10].gsub(/[789]/, ' ')
          all_lines_field_new[2] = field_line2
          all_lines_field_new[6] = field_line6
          all_lines_field_new[10] = field_line10

          puts all_lines_field_new
        when 'x3 y1'
          @player_moves << 3
          move = @all_lines_field[2].sub('3', 'X')
          @all_lines_field[2] = move

          all_lines_field_new = Array.new(@all_lines_field)
          field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').sub('2', ' ').sub('3', 'X')
          field_line6 = all_lines_field_new[6].gsub(/[456]/, ' ')
          field_line10 = all_lines_field_new[10].gsub(/[789]/, ' ')
          all_lines_field_new[2] = field_line2
          all_lines_field_new[6] = field_line6
          all_lines_field_new[10] = field_line10

          puts all_lines_field_new
        when 'x1 y2'
          @player_moves << 4
          move = @all_lines_field[6].sub('4', 'X')
          @all_lines_field[6] = move

          all_lines_field_new = Array.new(@all_lines_field)
          field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').gsub(/[23]/, ' ')
          field_line6 = all_lines_field_new[6].sub('4', 'X').sub('5', ' ').sub('6', ' ')
          field_line10 = all_lines_field_new[10].gsub(/[789]/, ' ')
          all_lines_field_new[2] = field_line2
          all_lines_field_new[6] = field_line6
          all_lines_field_new[10] = field_line10

          puts all_lines_field_new
        when 'x2 y2'
          @player_moves << 5
          move = @all_lines_field[6].sub('5', 'X')
          @all_lines_field[6] = move

          all_lines_field_new = Array.new(@all_lines_field)
          field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').gsub(/[23]/, ' ')
          field_line6 = all_lines_field_new[6].sub('4', ' ').sub('5', 'X').sub('6', ' ')
          field_line10 = all_lines_field_new[10].gsub(/[789]/, ' ')
          all_lines_field_new[2] = field_line2
          all_lines_field_new[6] = field_line6
          all_lines_field_new[10] = field_line10

          puts all_lines_field_new
        when 'x3 y2'
          @player_moves << 6
          move = @all_lines_field[6].sub('6', 'X')
          @all_lines_field[6] = move

          all_lines_field_new = Array.new(@all_lines_field)
          field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').gsub(/[23]/, ' ')
          field_line6 = all_lines_field_new[6].sub('4', ' ').sub('5', ' ').sub('6', 'X')
          field_line10 = all_lines_field_new[10].gsub(/[789]/, ' ')
          all_lines_field_new[2] = field_line2
          all_lines_field_new[6] = field_line6
          all_lines_field_new[10] = field_line10

          puts all_lines_field_new
        when 'x1 y3'
          @player_moves << 7
          move = @all_lines_field[10].sub('7', 'X')
          @all_lines_field[10] = move

          all_lines_field_new = Array.new(@all_lines_field)
          field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').gsub(/[23]/, ' ')
          field_line6 = all_lines_field_new[6].gsub(/[456]/, ' ')
          field_line10 = all_lines_field_new[10].sub('7', 'X').sub('8', ' ').sub('9', ' ')
          all_lines_field_new[2] = field_line2
          all_lines_field_new[6] = field_line6
          all_lines_field_new[10] = field_line10

          puts all_lines_field_new
        when 'x2 y3'
          @player_moves << 8
          move = @all_lines_field[10].sub('8', 'X')
          @all_lines_field[10] = move

          all_lines_field_new = Array.new(@all_lines_field)
          field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').gsub(/[23]/, ' ')
          field_line6 = all_lines_field_new[6].gsub(/[456]/, ' ')
          field_line10 = all_lines_field_new[10].sub('7', ' ').sub('8', 'X').sub('9', ' ')
          all_lines_field_new[2] = field_line2
          all_lines_field_new[6] = field_line6
          all_lines_field_new[10] = field_line10

          puts all_lines_field_new
        when 'x3 y3'
          @player_moves << 9
          move = @all_lines_field[10].sub('9', 'X')
          @all_lines_field[10] = move

          all_lines_field_new = Array.new(@all_lines_field)
          field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').gsub(/[23]/, ' ')
          field_line6 = all_lines_field_new[6].gsub(/[456]/, ' ')
          field_line10 = all_lines_field_new[10].sub('7', ' ').sub('8', ' ').sub('9', 'X')
          all_lines_field_new[2] = field_line2
          all_lines_field_new[6] = field_line6
          all_lines_field_new[10] = field_line10

          puts all_lines_field_new
      end

      # Варианты при которых юзер выигрывает
      positions_wins.each_value do |win|

        if win - @player_moves == []
          puts "Вы выиграли"
          abort
        end
      end

      if @comp_moves.size != 5
        puts 'Ход компьютера.'
        sleep 1.5
        cls
        comp_move = rand(1..9)

        while @comp_moves.include?(comp_move) ||
            @player_moves.include?(comp_move) do
          comp_move = rand(1..9)
        end
        @comp_moves << comp_move
        puts "Ходы компьютера: #{@comp_moves}"
      else
        puts 'Ничья.'
        abort
      end

      case comp_move.to_s
        when "1"
          move = @all_lines_field[2].sub('1', 'O')
          @all_lines_field[2] = move

          all_lines_field_new = Array.new(@all_lines_field)
          field_line2 = all_lines_field_new[2].sub('2', ' ').sub('3', ' ')
          field_line6 = all_lines_field_new[6].gsub(/[456]/, ' ')
          field_line10 = all_lines_field_new[10].gsub(/[789]/, ' ')
          all_lines_field_new[2] = field_line2
          all_lines_field_new[6] = field_line6
          all_lines_field_new[10] = field_line10

          puts all_lines_field_new
        when "2"
          move = @all_lines_field[2].sub('2', 'O')
          @all_lines_field[2] = move

          all_lines_field_new = Array.new(@all_lines_field)
          field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').sub('2', 'O').sub('3', ' ')
          field_line6 = all_lines_field_new[6].gsub(/[456]/, ' ')
          field_line10 = all_lines_field_new[10].gsub(/[789]/, ' ')
          all_lines_field_new[2] = field_line2
          all_lines_field_new[6] = field_line6
          all_lines_field_new[10] = field_line10

          puts all_lines_field_new
        when "3"
          move = @all_lines_field[2].sub('3', 'O')
          @all_lines_field[2] = move

          all_lines_field_new = Array.new(@all_lines_field)
          field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').sub('2', ' ').sub('3', 'O')
          field_line6 = all_lines_field_new[6].gsub(/[456]/, ' ')
          field_line10 = all_lines_field_new[10].gsub(/[789]/, ' ')
          all_lines_field_new[2] = field_line2
          all_lines_field_new[6] = field_line6
          all_lines_field_new[10] = field_line10

          puts all_lines_field_new
        when "4"
          move = @all_lines_field[6].sub('4', 'O')
          @all_lines_field[6] = move

          all_lines_field_new = Array.new(@all_lines_field)
          field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').gsub(/[23]/, ' ')
          field_line6 = all_lines_field_new[6].sub('4', 'O').sub('5', ' ').sub('6', ' ')
          field_line10 = all_lines_field_new[10].gsub(/[789]/, ' ')
          all_lines_field_new[2] = field_line2
          all_lines_field_new[6] = field_line6
          all_lines_field_new[10] = field_line10

          puts all_lines_field_new
        when "5"
          move = @all_lines_field[6].sub('5', 'O')
          @all_lines_field[6] = move

          all_lines_field_new = Array.new(@all_lines_field)
          field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').gsub(/[23]/, ' ')
          field_line6 = all_lines_field_new[6].sub('4', ' ').sub('5', 'O').sub('6', ' ')
          field_line10 = all_lines_field_new[10].gsub(/[789]/, ' ')
          all_lines_field_new[2] = field_line2
          all_lines_field_new[6] = field_line6
          all_lines_field_new[10] = field_line10

          puts all_lines_field_new
        when "6"
          move = @all_lines_field[6].sub('6', 'O')
          @all_lines_field[6] = move

          all_lines_field_new = Array.new(@all_lines_field)
          field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').gsub(/[23]/, ' ')
          field_line6 = all_lines_field_new[6].sub('4', ' ').sub('5', ' ').sub('6', 'O')
          field_line10 = all_lines_field_new[10].gsub(/[789]/, ' ')
          all_lines_field_new[2] = field_line2
          all_lines_field_new[6] = field_line6
          all_lines_field_new[10] = field_line10

          puts all_lines_field_new
        when "7"
          move = @all_lines_field[10].sub('7', 'O')
          @all_lines_field[10] = move

          all_lines_field_new = Array.new(@all_lines_field)
          field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').gsub(/[23]/, ' ')
          field_line6 = all_lines_field_new[6].gsub(/[456]/, ' ')
          field_line10 = all_lines_field_new[10].sub('7', 'O').sub('8', ' ').sub('9', ' ')
          all_lines_field_new[2] = field_line2
          all_lines_field_new[6] = field_line6
          all_lines_field_new[10] = field_line10

          puts all_lines_field_new
        when "8"
          move = @all_lines_field[10].sub('8', 'O')
          @all_lines_field[10] = move

          all_lines_field_new = Array.new(@all_lines_field)
          field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').gsub(/[23]/, ' ')
          field_line6 = all_lines_field_new[6].gsub(/[456]/, ' ')
          field_line10 = all_lines_field_new[10].sub('7', ' ').sub('8', 'O').sub('9', ' ')
          all_lines_field_new[2] = field_line2
          all_lines_field_new[6] = field_line6
          all_lines_field_new[10] = field_line10

          puts all_lines_field_new
        when "9"
          move = @all_lines_field[10].sub('9', 'O')
          @all_lines_field[10] = move

          all_lines_field_new = Array.new(@all_lines_field)
          field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').gsub(/[23]/, ' ')
          field_line6 = all_lines_field_new[6].gsub(/[456]/, ' ')
          field_line10 = all_lines_field_new[10].sub('7', ' ').sub('8', ' ').sub('9', 'O')
          all_lines_field_new[2] = field_line2
          all_lines_field_new[6] = field_line6
          all_lines_field_new[10] = field_line10

          puts all_lines_field_new
      end

      # Варианты при которых comp выигрывает
      positions_wins.each_value do |win|

        if win - @comp_moves == []
          puts 'Выиграл компьютер.'
          abort
        end
      end

    end # финал While

  end

  # Финал метода player_vs_comp

  def comp_vs_player # Компьютер против юзера
    puts "\nКомпьютер ходит.\n"
    sleep 2
  end

  # Финал метода comp_vs_player

  # Игрок против другого игрока
  def player_vs_player
    UnicodeUtils.downcase("D")
    puts "\nКак делать ход! Введите (лат.) x1 y1 и Enter\n\nСделайте ваш ход.\n\n"
  end # Финал метода player_vs_player

  # Метод очистки экрана
  def cls
    system "clear" or system "cls"
  end
end # Финал класса
