
# Объявляю пустой массив для записи в него всех строк файла
all_lines_field = []
player_moves = []
comp_moves = []
# Путь к файлу
		current_path = File.dirname(__FILE__)
		# Имя файла
		p_f = current_path + '/files_txt/playing_field.txt'
		# Проверка на существование файла
		if File.exist?(p_f)
		   # Открываю файл
			playing_field = File.open(p_f, "r:UTF-8")
		    # Записываю построчно файл в массив
		    all_lines_field = playing_field.readlines
		    # Закрываю файл
			playing_field.close
		    
		else 
			puts 'Файл не найден.'
		end

		
		
count = 0
while count <= 3
    

	puts "\nКак делать ход! Введите (лат.) x1 y1 и Enter\n\nСделайте ваш ход.\n\n"
		move_player = STDIN.gets.chomp # x1 y1
case move_player
    when 'x1 y1'
        player_moves << 1
        move = all_lines_field[2].sub('1', 'X')
		all_lines_field[2] = move

		all_lines_field_new = Array.new(all_lines_field)
		field_line2 = all_lines_field_new[2].sub('2', ' ').sub('3', ' ')
		field_line6 = all_lines_field_new[6].gsub(/[456]/, ' ')
		field_line10 = all_lines_field_new[10].gsub(/[789]/, ' ')
		all_lines_field_new[2] = field_line2
		all_lines_field_new[6] = field_line6
		all_lines_field_new[10] = field_line10

		puts all_lines_field_new
    when 'x2 y1'
        player_moves << 2
        move = all_lines_field[2].sub('2', 'X')
        all_lines_field[2] = move

    	all_lines_field_new = Array.new(all_lines_field)
        field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').sub('2', 'X').sub('3', ' ')
		field_line6 = all_lines_field_new[6].gsub(/[456]/, ' ')
        field_line10 = all_lines_field_new[10].gsub(/[789]/, ' ')
        all_lines_field_new[2] = field_line2
        all_lines_field_new[6] = field_line6
        all_lines_field_new[10] = field_line10

        puts all_lines_field_new
    when 'x3 y1'
        player_moves << 3
        move = all_lines_field[2].sub('3', 'X')
        all_lines_field[2] = move

    	all_lines_field_new = Array.new(all_lines_field)
    	field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').sub('2', ' ').sub('3', 'X')
		field_line6 = all_lines_field_new[6].gsub(/[456]/, ' ')
        field_line10 = all_lines_field_new[10].gsub(/[789]/, ' ')
        all_lines_field_new[2] = field_line2
        all_lines_field_new[6] = field_line6
        all_lines_field_new[10] = field_line10

        puts all_lines_field_new
    when 'x1 y2'
        player_moves << 4
        move = all_lines_field[6].sub('4', 'X')
        all_lines_field[6] = move

    	all_lines_field_new = Array.new(all_lines_field)
    	field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').gsub(/[23]/, ' ')
		field_line6 = all_lines_field_new[6].sub('4', 'X').sub('5', ' ').sub('6', ' ')
        field_line10 = all_lines_field_new[10].gsub(/[789]/, ' ')
        all_lines_field_new[2] = field_line2
        all_lines_field_new[6] = field_line6
        all_lines_field_new[10] = field_line10

        puts all_lines_field_new
    when 'x2 y2'
        player_moves << 5
        move = all_lines_field[6].sub('5', 'X')
        all_lines_field[6] = move

    	all_lines_field_new = Array.new(all_lines_field)
    	field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').gsub(/[23]/, ' ')
		field_line6 = all_lines_field_new[6].sub('4', ' ').sub('5', 'X').sub('6', ' ')
        field_line10 = all_lines_field_new[10].gsub(/[789]/, ' ')
        all_lines_field_new[2] = field_line2
        all_lines_field_new[6] = field_line6
        all_lines_field_new[10] = field_line10

        puts all_lines_field_new
    when 'x3 y2'
        player_moves << 6
        move = all_lines_field[6].sub('6', 'X')
        all_lines_field[6] = move

    	all_lines_field_new = Array.new(all_lines_field)
    	field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').gsub(/[23]/, ' ')
		field_line6 = all_lines_field_new[6].sub('4', ' ').sub('5', ' ').sub('6', 'X')
        field_line10 = all_lines_field_new[10].gsub(/[789]/, ' ')
        all_lines_field_new[2] = field_line2
        all_lines_field_new[6] = field_line6
        all_lines_field_new[10] = field_line10

        puts all_lines_field_new
    when 'x1 y3'
        player_moves << 7
        move = all_lines_field[10].sub('7', 'X')
        all_lines_field[10] = move

    	all_lines_field_new = Array.new(all_lines_field)
    	field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').gsub(/[23]/, ' ')
		field_line6 = all_lines_field_new[6].gsub(/[456]/, ' ')
        field_line10 = all_lines_field_new[10].sub('7', 'X').sub('8', ' ').sub('9', ' ')
        all_lines_field_new[2] = field_line2
        all_lines_field_new[6] = field_line6
        all_lines_field_new[10] = field_line10

        puts all_lines_field_new
    when 'x2 y3'
        player_moves << 8
        move = all_lines_field[10].sub('8', 'X')
        all_lines_field[10] = move

    	all_lines_field_new = Array.new(all_lines_field)
    	field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').gsub(/[23]/, ' ')
		field_line6 = all_lines_field_new[6].gsub(/[456]/, ' ')
        field_line10 = all_lines_field_new[10].sub('7', ' ').sub('8', 'X').sub('9', ' ')
        all_lines_field_new[2] = field_line2
        all_lines_field_new[6] = field_line6
        all_lines_field_new[10] = field_line10

        puts all_lines_field_new
    when 'x3 y3'
        player_moves << 9
        move = all_lines_field[10].sub('9', 'X')
        all_lines_field[10] = move

    	all_lines_field_new = Array.new(all_lines_field)
    	field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').gsub(/[23]/, ' ')
		field_line6 = all_lines_field_new[6].gsub(/[456]/, ' ')
        field_line10 = all_lines_field_new[10].sub('7', ' ').sub('8', ' ').sub('9', 'X')
        all_lines_field_new[2] = field_line2
        all_lines_field_new[6] = field_line6
        all_lines_field_new[10] = field_line10

        puts all_lines_field_new
    end		
    puts 'Ход компьютера.'
    comp_move = rand(1..9)
    
    case comp_move.to_s
    when '1'
        comp_moves << 1
        move = all_lines_field[2].sub('1', 'O')
        all_lines_field[2] = move

        all_lines_field_new = Array.new(all_lines_field)
        field_line2 = all_lines_field_new[2].sub('2', ' ').sub('3', ' ')
        field_line6 = all_lines_field_new[6].gsub(/[456]/, ' ')
        field_line10 = all_lines_field_new[10].gsub(/[789]/, ' ')
        all_lines_field_new[2] = field_line2
        all_lines_field_new[6] = field_line6
        all_lines_field_new[10] = field_line10

        puts all_lines_field_new
    when '2'
        comp_moves << 2
        move = all_lines_field[2].sub('2', 'O')
        all_lines_field[2] = move

        all_lines_field_new = Array.new(all_lines_field)
        field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').sub('2', 'O').sub('3', ' ')
        field_line6 = all_lines_field_new[6].gsub(/[456]/, ' ')
        field_line10 = all_lines_field_new[10].gsub(/[789]/, ' ')
        all_lines_field_new[2] = field_line2
        all_lines_field_new[6] = field_line6
        all_lines_field_new[10] = field_line10

        puts all_lines_field_new
    when '3'
        comp_moves << 3
        move = all_lines_field[2].sub('3', 'O')
        all_lines_field[2] = move

        all_lines_field_new = Array.new(all_lines_field)
        field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').sub('2', ' ').sub('3', 'O')
        field_line6 = all_lines_field_new[6].gsub(/[456]/, ' ')
        field_line10 = all_lines_field_new[10].gsub(/[789]/, ' ')
        all_lines_field_new[2] = field_line2
        all_lines_field_new[6] = field_line6
        all_lines_field_new[10] = field_line10

        puts all_lines_field_new
    when '4'
        comp_moves << 4
        move = all_lines_field[6].sub('4', 'O')
        all_lines_field[6] = move

        all_lines_field_new = Array.new(all_lines_field)
        field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').gsub(/[23]/, ' ')
        field_line6 = all_lines_field_new[6].sub('4', 'O').sub('5', ' ').sub('6', ' ')
        field_line10 = all_lines_field_new[10].gsub(/[789]/, ' ')
        all_lines_field_new[2] = field_line2
        all_lines_field_new[6] = field_line6
        all_lines_field_new[10] = field_line10

        puts all_lines_field_new
    when '5'
        comp_moves << 5
        move = all_lines_field[6].sub('5', 'O')
        all_lines_field[6] = move

        all_lines_field_new = Array.new(all_lines_field)
        field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').gsub(/[23]/, ' ')
        field_line6 = all_lines_field_new[6].sub('4', ' ').sub('5', 'O').sub('6', ' ')
        field_line10 = all_lines_field_new[10].gsub(/[789]/, ' ')
        all_lines_field_new[2] = field_line2
        all_lines_field_new[6] = field_line6
        all_lines_field_new[10] = field_line10

        puts all_lines_field_new
    when '6'
        comp_moves << 6
        move = all_lines_field[6].sub('6', 'O')
        all_lines_field[6] = move

        all_lines_field_new = Array.new(all_lines_field)
        field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').gsub(/[23]/, ' ')
        field_line6 = all_lines_field_new[6].sub('4', ' ').sub('5', ' ').sub('6', 'O')
        field_line10 = all_lines_field_new[10].gsub(/[789]/, ' ')
        all_lines_field_new[2] = field_line2
        all_lines_field_new[6] = field_line6
        all_lines_field_new[10] = field_line10

        puts all_lines_field_new
    when '7'
        comp_moves << 7
        move = all_lines_field[10].sub('7', 'O')
        all_lines_field[10] = move

        all_lines_field_new = Array.new(all_lines_field)
        field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').gsub(/[23]/, ' ')
        field_line6 = all_lines_field_new[6].gsub(/[456]/, ' ')
        field_line10 = all_lines_field_new[10].sub('7', 'O').sub('8', ' ').sub('9', ' ')
        all_lines_field_new[2] = field_line2
        all_lines_field_new[6] = field_line6
        all_lines_field_new[10] = field_line10

        puts all_lines_field_new
    when '8'
        comp_moves << 8
        move = all_lines_field[10].sub('8', 'O')
        all_lines_field[10] = move

        all_lines_field_new = Array.new(all_lines_field)
        field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').gsub(/[23]/, ' ')
        field_line6 = all_lines_field_new[6].gsub(/[456]/, ' ')
        field_line10 = all_lines_field_new[10].sub('7', ' ').sub('8', 'O').sub('9', ' ')
        all_lines_field_new[2] = field_line2
        all_lines_field_new[6] = field_line6
        all_lines_field_new[10] = field_line10

        puts all_lines_field_new
    when '9'
        comp_moves << 9
        move = all_lines_field[10].sub('9', 'O')
        all_lines_field[10] = move

        all_lines_field_new = Array.new(all_lines_field)
        field_line2 = all_lines_field_new[2].sub(/(.*)1(.*)1(.*)/, '\1 \21\3').gsub(/[23]/, ' ')
        field_line6 = all_lines_field_new[6].gsub(/[456]/, ' ')
        field_line10 = all_lines_field_new[10].sub('7', ' ').sub('8', ' ').sub('9', 'O')
        all_lines_field_new[2] = field_line2
        all_lines_field_new[6] = field_line6
        all_lines_field_new[10] = field_line10

        puts all_lines_field_new
    end

    count += 1
end
# move = all_lines_field[2].sub(/(.*)#(.*)#(.*)#(.*)/, '\1X\2#\3#\4')
