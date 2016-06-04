class ShowField

  def initialize
    @all_lines_field = []
  end

  # Метод читающий файл с игровым полем
  def read_file
    current_path = File.dirname(__FILE__)
    file_name = current_path + '/../templates/playing_field.txt'
    # Проверка на существование файла
    if File.exist?(file_name)
      playing_field = File.open(file_name, "r:UTF-8")
      @all_lines_field = playing_field.readlines
      playing_field.close
    else
      puts 'Файл не найден.'
    end
    @all_lines_field
  end
  # Метод выводит пустое поле на экран
  def show_field(all_lines_field)
    field_all_lines = Array.new(all_lines_field)
    line2 = field_all_lines[2].gsub(/[123]/, ' ')
    field_all_lines[2] = line2

    line6 = field_all_lines[6].gsub(/[456]/, ' ')
    field_all_lines[6] = line6

    line10 = field_all_lines[10].gsub(/[789]/, ' ')
    field_all_lines[10] = line10

    puts field_all_lines
  end

  def show_move(move, symbol)

    l2 = @all_lines_field[2].sub(move.to_s, symbol)
    l6 = @all_lines_field[6].sub(move.to_s, symbol)
    l10 = @all_lines_field[10].sub(move.to_s, symbol)
    @all_lines_field[2] = l2
    @all_lines_field[6] = l6
    @all_lines_field[10] = l10

    field_new = Array.new(@all_lines_field)
    line2 = field_new[2].sub(move.to_s, symbol).gsub(/[123]/, ' ')
    line6 = field_new[6].sub(move.to_s, symbol).gsub(/[456]/, ' ')
    line10 = field_new[10].sub(move.to_s, symbol).gsub(/[789]/, ' ')
    field_new[2] = line2
    field_new[6] = line6
    field_new[10] = line10

    puts field_new
  end

end