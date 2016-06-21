if (Gem.win_platform?) # если винда
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'lib/screensaver.rb'
require_relative 'lib/show_field.rb'
require_relative 'lib/game.rb'
require_relative 'lib/comp_ii'

require "unicode_utils/downcase"

show = Screensaver.new
show_field = ShowField.new
game = Game.new
ii = CompII.new

show.show_screen # Вывожу заставку на экран
show.cls

show_field.show_move(show_field.read_file, '', '')
# пока пользователь не сделал 5 ходов
while game.player_moves.size != 5

  puts "\n\rСделайте ваш ход. (Как делать ход: x1 y1 и Enter)\n"
  player_move = STDIN.gets.chomp.downcase
  # Проверка, чтобы юзер не ввел ерунду
  while !game.all_moves.value?(player_move) do
    puts "\nСделайте ваш ход. (Как делать ход: x1 y1 и Enter)\n"
    player_move = STDIN.gets.chomp.downcase
  end

  case player_move
  when 'x1 y1'
    player_move = 1
  when 'x2 y1'
    player_move = 2
  when 'x3 y1'
    player_move = 3
  when 'x1 y2'
    player_move = 4
  when 'x2 y2'
    player_move = 5
  when 'x3 y2'
    player_move = 6
  when 'x1 y3'
    player_move = 7
  when 'x2 y3'
    player_move = 8
  when 'x3 y3'
    player_move = 9
  end
  # Вывожу ход юзера на игровое поле
  show_field.show_move(show_field.pattern_field, player_move, 'X')
  game.add_player_move(player_move)
  # проверяю не выиграл ли юзер на этом ходу
  if game.player_won?(game.player_moves) == true
    puts "Вы выиграли!"
    abort
  end

  if game.player_moves.size == 5
    puts 'Ничья'
    abort
  end

  puts 'Ход компьютера.'
  comp_move = ii.comp_move(game.player_moves)
  # Вывожу ход компа на игровое поле
  show_field.show_move(show_field.pattern_field, comp_move, 'O')
  game.add_comp_move(comp_move)
  # проверяю не выиграл ли комп на этом ходу
  if game.comp_won?(game.comp_moves) == true
    puts "Выиграл компьютер."
    abort
  end

end
	