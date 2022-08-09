require_relative('./classes/list')
class App
  def initialize
    @list = List.new
  end

  def options
    loop do
      display_list
      option = gets.chomp.to_i
      if option <= 4
        first_correction(option)

      elsif option > 4 && option <= 8
        second_correction(option)
      else
        break
      end
    end
    display_list
  end

  def first_correction(option)
    case option
    when 1
      @list.list_all_books
    when 2
      @list.list_all_music_albums
    when 3
      @list.list_all_movies
    when 4
      @list.list_all_games
    end
  end

  def second_correction(option)
    case option
    when 5
      @list.list_all_genres
    when 6
      @list.list_all_labels
    when 7
      @list.list_all_authors
    when 8
      @list.list_all_sources
    end
  end
end