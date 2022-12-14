require_relative('../modules/user_input')
require_relative('../modules/save_data')
require_relative('../item')
require_relative('../classes/book')
require_relative('../classes/game')
require_relative('../classes/music_album')
require_relative('genre')
require_relative('label')
require_relative('author')

class Create
  include UserInput
  include SaveDate

  def create_item(received_class)
    Item.new(received_class)
  end

  def create_genre(element)
    name = request_genre(element)
    genre = Genre.new(name)
    item = create_item(genre)
    genre.add_item(item)
  end

  def create_label(element)
    title, color = request_label(element)
    label = Label.new(title, color)
    item = create_item(label)
    label.add_item(item)
  end

  def create_author(element)
    first_name, last_name = request_author(element)
    author = Author.new(first_name, last_name)
    item = create_item(author)
    author.add_item(item)
  end

  def create_game
    puts "Let's create a game!:"
    new_label = create_label('Game')
    new_author = create_author('Author')
    new_genre = create_genre('Game')
    multiplayer, last_played_at, publish_date = request_game
    new_game = Game.new(multiplayer, Time.new(last_played_at), publish_date: Time.new(publish_date))
    new_game.move_to_archive
    save_game(new_author, new_label, new_genre, new_game)
    puts 'Game created successfully.'
  end

  def create_music_album
    puts "Let's create a Music Album!:"
    new_label = create_label('Album')
    new_author = create_author('Singer')
    new_genre = create_genre('Album')
    on_spotify, publish_date = request_music_album
    new_music_album = MusicAlbum.new(on_spotify, publish_date: Time.new(publish_date))
    new_music_album.move_to_archive
    save_music_album(new_author, new_label, new_genre, new_music_album)
    puts 'Music Album created successfully.'
  end

  def create_book
    puts "Let's create a book!:"
    new_label = create_label('Book')
    new_author = create_author('Author')
    new_genre = create_genre('Book')
    publisher, cover_state, publish_date = request_book('Book')
    new_book = Book.new(publisher, cover_state, publish_date: Time.new(publish_date))
    new_book.move_to_archive
    save_book(new_author, new_label, new_genre, new_book)
    puts 'Book created successfully.'
  end
end
