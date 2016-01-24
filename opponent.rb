# Класс Opponent- В классе производится выбор соперника,
# а так-же, кто чем будет играть.
class Opponent

	def initialize
		@opponent_choise = 0
		# Переменная для записи выбора юзером чем он будет играть
		@than_to_play = 0
		# Переменная для записи случайно-выбранного компьютером имени
		@comp_choise = nil
		# Имена пользователей
		@name1
		@name2 
	end
		# Выбор противника  
     def choice_of_opponent
     	# Спрашиваю юзера с кем он хочет играть
		puts "\nС кем бы вы хотели играть:\n
		1. С компьютером. (Нажмите-1 и Enter)
		2. С другим игроком. (Нажмите-2 и Enter)\n"
			numbers = [1, 2] # Массив для будущей проверки
			choise_user = STDIN.gets.chomp.to_i
		# Проверка, чтобы юзер не ввёл ерунду
		while !numbers.include?(choise_user)  do
		puts "\nС кем бы вы хотели играть:\n
		1. С компьютером. (Нажмите-1 и Enter)
		2. С другим игроком. (Нажмите-2 и Enter)\n"
				choise_user = STDIN.gets.chomp.to_i
		end
		# Переменная с результатом выбора юзера (с кем играть?)
     	@opponent_choise = choise_user.to_i
     	if @opponent_choise == 1
     		return 1
     	end
     end # Финал метода choice_of_opponent

     	# Чем будем играть
        def what_we_play1
        		# Если выбран вариант с компьютером
	    		puts "\n Чем бы вы хотели играть:\n
	    		1. Крестики. (Нажмите-1 и Enter)
	    		2. Нолики.   (Нажмите-2 и Enter)\n
	    		Выбрав крестики вы делаете первый ход.\n"
	    		number = [1, 2] # Массив для будущей проверки
	    		user_input = STDIN.gets.chomp.to_i
	    			# Проверка, чтобы юзер не ввёл ерунду
	    			while !number.include?(user_input) do
						puts "\n Чем бы вы хотели играть:\n
			    		1. Крестики. (Нажмите-1 и Enter)
			    		2. Нолики.   (Нажмите-2 и Enter)\n
			    		Выбрав крестики вы делаете первый ход.\n"
						user_input = STDIN.gets.chomp.to_i
					end
				# Переменная с результатом выбора юзера (чем играть?)
	    		@than_to_play = user_input.to_i
	    		if @than_to_play == 1
	    			return 1	
	    		end
	    end # Финал метода what_we_play1

	    	def what_we_play2
	    		# Если выбран вариант с другим игроком
	    		# Спрашиваю имена будущих игроков
	    		puts "\nИгрок-1 Введите своё имя.\n"
	    		@name1 = STDIN.gets.encode("UTF-8").chomp
	    		# Если юзер ничего не ввёл
	    		while @name1 == ""
	    			puts "\nИгрок-1 Введите своё имя.\n"
	    			@name1 = STDIN.gets.encode("UTF-8").chomp
	    		end
	    		puts "\nИгрок-2 Введите своё имя.\n"
	    		@name2 = STDIN.gets.encode("UTF-8").chomp
	    		while @name2 == "" # Если юзер ничего не ввёл
	    			puts "\nИгрок-2 Введите своё имя.\n"
	    			@name2 = STDIN.gets.encode("UTF-8").chomp
	    		end
	    		puts "\nСейчас, компьютер выберет, кто из вас будет
	    		\rиграть крестиками и первым делать ход\n"
	    		sleep 4
	    		names = [@name1, @name2]
	    		@comp_choise = names.sample
	    		puts "\n Выбор компьютера:\n #{@comp_choise.to_s}  будет играть крестиками.\n"
	    		sleep 3
	    		if @comp_choise == @name1
		    		return 1
		    	end	
	    	end # Финал метода what_we_play2
		# Гетеры с именами игроков
        def name1  
			@name1
		end
		def name2
			@name2		
		end
end # Финал класса Opponent