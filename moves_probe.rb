if (Gem.win_platform?) # если винда
    Encoding.default_external = Encoding.find(Encoding.locale_charmap)
    Encoding.default_internal = __ENCODING__

    [STDIN, STDOUT].each do |io|
        io.set_encoding(Encoding.default_external, Encoding.default_internal)
    end
end
# Массив для записи ходов юзера
player_moves = []
# Массив для записи ходов компьютера
comp_moves = []
# хеш с выигрышными комбинациями
positions_wins = {1=> [1,2,3], 2=> [4,5,6], 3=> [7,8,9], 4=> [1,4,7],
                  5=> [2,5,8], 6=> [3,6,9], 7=> [1,5,9], 8=> [3,5,7]}

# хеш всех ходов для проверки пользователя.
all_moves = {1 => "x1 y1", 2 => "x2 y1", 3 =>"x3 y1", 4 => "x1 y2", 5 => "x2 y2",
             6 => "x3 y2", 7 => "x1 y3", 8 => "x2 y3", 9 => "x3 y3"}


    # Пока юзер не сделал 5 ходов
    while player_moves.size < 5

        # Прошу пользователя сделать ход
        puts "\nСделайте ваш ход. (Как делать ход: x1 y1 и Enter)\n"
        move_user = STDIN.gets.chomp
        # Проверка, чтобы юзер не ввел ерунду
        while !all_moves.value?(move_user) do
          puts "\nСделайте ваш ход. (Как делать ход: x1 y1 и Enter)\n"
          move_user = STDIN.gets.chomp
        end

        # Каждый ход юзера добавляется в массив
        all_moves.each do |key, move|
           if move == move_user
             player_moves << key
           end
        end

        print "Ваши ходы: #{player_moves}\n"
        # Варианты при которых юзер выигрывает
        positions_wins.each_value do |win|

            if win - player_moves == []
              puts "Вы выиграли"
              abort
            end
        end

      if comp_moves.size <= 4
             puts "Ход компьютера."
             comp_move = rand(1..9)
          while comp_moves.include?(comp_move) || player_moves.include?(comp_move) do
              comp_move = rand(1..9)
          end
              puts comp_move
              comp_moves << comp_move
              puts "Ходы компьютера: #{comp_moves}"
      else
              puts 'Ничья.'
              abort
      end
        # Варианты при которых comp выигрывает
        positions_wins.each_value do |win|

          if win - comp_moves == []
            puts "Вы выиграли"
            abort
          end
        end
    end