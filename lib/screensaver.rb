class Screensaver
# Метод печатающий заставку
  def show_screen
    # Путь к файлу
    current_path = File.dirname(__FILE__)
    # Имя файла
    screen = current_path + '/../templates/screensaver.txt'
    # Проверка на существование файла
    if File.exist?(screen)
      # Открываю файл
      file = File.open(screen, "r:UTF-8")
      # Переменная с прочтенным файлом
      show_move = file.readlines
      # Печатаю заставку игры
      puts
      puts
      puts
      puts show_move
      # Оставляю заставку на 3 секунды
      sleep 3
    else
      puts "Файл не найден."
    end
  end

  def cls
    system "clear" or system "cls"
  end

end
