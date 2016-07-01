class Screensaver
  # Метод печатающий заставку
  def show_screen
    current_path = File.dirname(__FILE__)
    screen = current_path + '/../templates/screensaver.txt'
    # Проверка на существование файла
    if File.exist?(screen)
      file = File.open(screen, 'r:UTF-8')
      show_move = file.readlines
      puts
      puts
      puts
      puts show_move
      sleep 2
    else
      puts 'Файл не найден.'
    end
  end

  def cls
    system 'clear' or system 'cls'
  end
end
