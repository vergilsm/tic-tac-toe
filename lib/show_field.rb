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

  def all_lines_field
    @all_lines_field
  end

end