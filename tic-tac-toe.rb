if (Gem.win_platform?) # если винда
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
# Присоединяю файлы
require './screensaver.rb'
require './opponent.rb'
require './game.rb'
# Объявляю переменные с классами
show = Screensaver.new
gamer_choise = Opponent.new
game = Game.new
show.cls # Чищу экран
show.show_screen # Вывожу заставку на экран
show.cls # Удаляю заставку
# Вывожу игровое поле на экран
game.field
# Спрашиваю у пользовател с кем он хочет играть 1)Компьютер 2)Другой игрок
	# Если выбран вариант с компьютером
	if gamer_choise.choice_of_opponent == 1   		
		# Спрашиваю чем он хочет играть Х или О
		# В зависимости от варианта выбора начинаю игру
		# Если юзер выбрал крестики
		if gamer_choise.what_we_play1 == 1
		# Запускаю игру player_vs_comp
		show.cls # Чищу экран
		game.field # Вывожу игровое поле на экран
		game.player_vs_comp
		# Если юзер выбрал нолики
		else
		show.cls
		game.field
		game.comp_vs_player
		end
	# Если выбран вариант с другим игроком
	else
		if gamer_choise.what_we_play2 == 1
			show.cls
			puts "\n\r#{gamer_choise.name1} Ваш ход первый.\n"
			game.field
			game.player_vs_player
		else
			show.cls
			puts "\n\r#{gamer_choise.name2} Ваш ход первый.\n"
			game.field
			game.player_vs_player
		end	
	end
	