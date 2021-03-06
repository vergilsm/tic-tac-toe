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

require 'unicode_utils/downcase'

show = Screensaver.new
show_field = ShowField.new
game = Game.new
ii = CompII.new

show.show_screen
show.cls

show_field.show_move(show_field.read_file, '', '')

while game.player_moves.size != 5

  puts "\n\rСделайте ваш ход. (Как делать ход: x1 y1 и Enter)\n"
  player_input = $stdin.gets.chomp.downcase
  # Проверка, чтобы юзер не ввел ерунду
  until game.all_moves.value?(player_input)
    puts "\nСделайте ваш ход. (Как делать ход: x1 y1 и Enter)\n"
    player_input = $stdin.gets.chomp.downcase
  end

  player_move = Game::ALL_MOVES.invert[player_input]

  show_field.show_move(show_field.pattern_field, player_move, 'X')
  game.add_player_move(player_move)

  if game.player_won?(game.player_moves) == true
    puts 'Вы выиграли!'
    abort
  end

  if game.player_moves.size == 5
    puts 'Ничья'
    abort
  end

  puts 'Ход компьютера.'
  comp_move = ii.comp_move(game.player_moves)

  show_field.show_move(show_field.pattern_field, comp_move, 'O')
  game.add_comp_move(comp_move)

  if game.comp_won?(game.comp_moves) == true
    puts 'Выиграл компьютер.'
    abort
  end
end
