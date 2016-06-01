class ShowField

  def initialize
    @all_lines_field = []
  end

  # Метод хранящий игровое поле и поле выводимое на экран
  def field
    current_path = File.dirname(__FILE__)
    file_name = current_path + '/../templates/playing_field.txt'
    # Проверка на существование файла
    if File.exist?(file_name)
      playing_field = File.open(file_name, "r:UTF-8")

      @all_lines_field = playing_field.readlines

      playing_field.close
      # Возвращаю наглядное поле
      # Создаю клон поля, удаляю из него все цифры и вывожу поле на экран
      clone_all_lines = @all_lines_field.clone
      line2 = clone_all_lines[2].gsub(/[123]/, ' ')
      clone_all_lines[2] = line2

      line6 = clone_all_lines[6].gsub(/[456]/, ' ')
      clone_all_lines[6] = line6

      line10 = clone_all_lines[10].gsub(/[789]/, ' ')
      clone_all_lines[10] = line10

      puts clone_all_lines
    else
      puts 'Файл не найден.'
    end
  end

  def show_player_move(player_move)

    l2 = @all_lines_field[2].sub(player_move.to_s, "X")
    l6 = @all_lines_field[6].sub(player_move.to_s, "X")
    l10 = @all_lines_field[10].sub(player_move.to_s, "X")
    @all_lines_field[2] = l2
    @all_lines_field[6] = l6
    @all_lines_field[10] = l10

    field_new = Array.new(@all_lines_field)
    line2 = field_new[2].sub(player_move.to_s, 'X').gsub(/[123]/, ' ')
    line6 = field_new[6].sub(player_move.to_s, 'X').gsub(/[456]/, ' ')
    line10 = field_new[10].sub(player_move.to_s, 'X').gsub(/[789]/, ' ')
    field_new[2] = line2
    field_new[6] = line6
    field_new[10] = line10

    puts field_new
  end

  def show_comp_move(comp_move)

    l2 = @all_lines_field[2].sub(comp_move.to_s, "O")
    l6 = @all_lines_field[6].sub(comp_move.to_s, "O")
    l10 = @all_lines_field[10].sub(comp_move.to_s, "O")
    @all_lines_field[2] = l2
    @all_lines_field[6] = l6
    @all_lines_field[10] = l10

    field_new = Array.new(@all_lines_field)
    line2 = field_new[2].sub(comp_move.to_s, 'O').gsub(/[123]/, ' ')
    line6 = field_new[6].sub(comp_move.to_s, 'O').gsub(/[456]/, ' ')
    line10 = field_new[10].sub(comp_move.to_s, 'O').gsub(/[789]/, ' ')
    field_new[2] = line2
    field_new[6] = line6
    field_new[10] = line10

    puts field_new
  end
end