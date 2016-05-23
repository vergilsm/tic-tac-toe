if (Gem.win_platform?) # если винда
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'lib/screensaver.rb'
require_relative 'lib/game.rb'
require_relative 'lib/comp_ii'

require "unicode_utils/downcase"

show = Screensaver.new
game = Game.new
ii = CompII.new

show.show_screen # Вывожу заставку на экран
show.cls
# Вывожу игровое поле на экран
game.field
# пока пользователь не сделал 5 ходов
while game.player_moves.size != 5
  # Прошу пользователя сделать ход
  puts "\n\rСделайте ваш ход. (Как делать ход: x1 y1 и Enter)\n"
  move_player = STDIN.gets.chomp.downcase
  # Проверка, чтобы юзер не ввел ерунду
  while !game.all_moves.value?(move_player) do
    puts "\nСделайте ваш ход. (Как делать ход: x1 y1 и Enter)\n"
    move_player = STDIN.gets.chomp.downcase
  end

  case move_player
    when 'x1 y1'
      move_player = 1
    when 'x2 y1'
      move_player = 2
    when 'x3 y1'
      move_player = 3
    when 'x1 y2'
      move_player =4
    when 'x2 y2'
      move_player = 5
    when 'x3 y2'
      move_player = 6
    when 'x1 y3'
      move_player = 7
    when 'x2 y3'
      move_player = 8
    when 'x3 y3'
      move_player = 9
  end
  # Вывожу ход юзера на игровое поле
  game.move_player(move_player)
  # проверяю не выиграл ли юзер на этом ходу
  game.win(game.player_moves)

  puts "Ход компьютера."
  comp_move = ii.comp_move(game.player_moves)
  # Пока ходы компа будут совподать с уже сделанными ходами
  while game.comp_moves.include?(comp_move) ||
      game.player_moves.include?(comp_move) do
    # комп будет искать вариант хода
    comp_move = ii.comp_move(game.player_moves)
  end
  # Вывожу ход компа на игровое поле
  game.move_comp(comp_move)
  # проверяю не выиграл ли комп на этом ходу
  game.win(game.comp_moves)

  if game.player_moves.size == 5
    puts 'Ничья'
    abort
  end
end
	