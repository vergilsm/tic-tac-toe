class ShowField
  attr_reader :pattern_field

  # Метод читающий файл с игровым полем
  def read_file
    current_path = File.dirname(__FILE__)
    file_name = current_path + '/../templates/playing_field.txt'
    # Проверка на существование файла
    if File.exist?(file_name)
      playing_field = File.open(file_name, 'r:UTF-8')
      @pattern_field = playing_field.readlines
      playing_field.close
    else
      puts 'Файл не найден.'
    end
    @pattern_field
  end
  # Метод выводящий на экран игровое поле с ходами игроков
  def show_move(pattern_field, move, symbol)
    l2 = pattern_field[2].sub(move.to_s, symbol)
    l6 = pattern_field[6].sub(move.to_s, symbol)
    l10 = pattern_field[10].sub(move.to_s, symbol)

    pattern_field[2] = l2
    pattern_field[6] = l6
    pattern_field[10] = l10

    field_new = Array.new(pattern_field)
    line2 = field_new[2].sub(move.to_s, symbol).gsub(/[123]/, ' ')
    line6 = field_new[6].sub(move.to_s, symbol).gsub(/[456]/, ' ')
    line10 = field_new[10].sub(move.to_s, symbol).gsub(/[789]/, ' ')

    field_new[2] = line2
    field_new[6] = line6
    field_new[10] = line10

    puts field_new
  end
end
