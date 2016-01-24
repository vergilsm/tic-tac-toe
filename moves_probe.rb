# Массив для записи ходов юзера
player_moves = []
# Массив для записи ходов компьютера
comp_moves = []
# хеш с выиграшными комбинациями
positions_wins = {1=> [1,2,3], 2=> [4,5,6], 3=> [7,8,9], 4=> [1,4,7], 5=> [2,5,8], 6=> [3,6,9], 7=> [1,5,9], 8=> [3,5,7]
                 }

# Массив всех ходов для проверки пользователя.
all_moves = ["x1 y1", "x2 y1", "x3 y1", "x1 y2", "x2 y2", "x3 y2", "x1 y3", "x2 y3", "x3 y3"]
#positions_wins = { 1 => ['x1 y1', 'x2 y1', 'x3 y1'], 2 => ['x1 y2', 'x2 y2', 'x3 y2'], 3 => ['x1 y3', 'x2 y3', 'x3 y3'],
#                 4 => ['x1 y1', 'x1 y2', 'x1 y3'], 5 => ['x2 y1', 'x2 y2', 'x2 y3'], 6 => ['x3 y1', 'x3 y2', 'x3 y3'],
#                 7 => ['x1 y1', 'x2 y2', 'x3 y3'], 8 => ['x3 y1', 'x2 y2', 'x1 y3']
#               }

    # Пока юзер не сделал 5 ходов
    while player_moves.size < 5

        # Прошу пользователя сделать ход
        puts "\nСделайте ваш ход. (Как делать ход: x1 y1 и Enter)\n"
        move_user = STDIN.gets.chomp
        player_moves << move_user
        # Проверка, чтобы юзер не ввел ерунду
        while !all_moves.include?(move_user) && player_moves.include?(move_user) &&
        comp_moves.include?(move_user) do
            puts "\nСделайте ваш ход. (Как делать ход: x1 y1 и Enter)\n"
            move_user = STDIN.gets.chomp
        end
        # Каждый ход юзера добавляется в массив
        

        print "Ваши ходы: #{player_moves}\n"
        # Варианты при которых юзер выигрывает
        if player_moves.include?(1) && player_moves.include?(2) && player_moves.include?(3)
          puts 'Вы выиграли!'
          abort
        elsif player_moves.include?(4) && player_moves.include?(5) && player_moves.include?(6)
            puts 'Вы выиграли!'
            abort
        elsif player_moves.include?(7) && player_moves.include?(8) && player_moves.include?(9)
            puts 'Вы выиграли!'
            abort
        elsif player_moves.include?(1) && player_moves.include?(4) && player_moves.include?(7)
            puts 'Вы выиграли!'
            abort
        elsif player_moves.include?(2) && player_moves.include?(5) && player_moves.include?(8)
            puts 'Вы выиграли!'
            abort
        elsif player_moves.include?(3) && player_moves.include?(6) && player_moves.include?(9)
            puts 'Вы выиграли!'
            abort
        elsif player_moves.include?(1) && player_moves.include?(5) && player_moves.include?(9)
            puts 'Вы выиграли!'
            abort
        elsif player_moves.include?(3) && player_moves.include?(5) && player_moves.include?(7)
            puts 'Вы выиграли!'
            abort
        end

    if comp_moves.size <= 3
           puts 'Ход компьютера.'
           comp_move = all_moves.sample
        
        while comp_moves.include?(comp_move) && player_moves.include?(comp_move) do
            puts 'Ход компьютера.'
            comp_move = all_moves.sample
            
        end
            comp_moves << comp_move
            puts "Ходы компьютера: #{comp_moves}"
    else
            puts 'Ничья.'
            abort
    end
        if comp_moves.include?(1) && comp_moves.include?(2) && comp_moves.include?(3)
          puts 'Выиграл компьютер.'
          abort
        elsif comp_moves.include?(4) && comp_moves.include?(5) && comp_moves.include?(6)
            puts 'Выиграл компьютер.'
            abort
        elsif comp_moves.include?(7) && comp_moves.include?(8) && comp_moves.include?(9)
            puts 'Выиграл компьютер.'
            abort
        elsif comp_moves.include?(1) && comp_moves.include?(4) && comp_moves.include?(7)
            puts 'Выиграл компьютер.'
            abort
        elsif comp_moves.include?(2) && comp_moves.include?(5) && comp_moves.include?(8)
            puts 'Выиграл компьютер.'
            abort
        elsif comp_moves.include?(3) && comp_moves.include?(6) && comp_moves.include?(9)
            puts 'Выиграл компьютер.'
            abort
        elsif comp_moves.include?(1) && comp_moves.include?(5) && comp_moves.include?(9)
            puts 'Выиграл компьютер.'
            abort
        elsif comp_moves.include?(3) && comp_moves.include?(5) && comp_moves.include?(7)
            puts 'Выиграл компьютер.'
            abort
        end

    end # Финал while

        