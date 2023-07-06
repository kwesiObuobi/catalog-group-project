require_relative '../classes/book'

module BookModule
  def add_book
    puts
    print 'Add book publisher: '
    publisher = gets.chomp
    print 'Add published date [yyyy-mm-dd]: '
    published_date = gets.chomp
    print 'Cover State [good/bad]: '
    cover_state = gets.chomp
    curr_book = Book.new(published_date, publisher, cover_state)
    @books.push(curr_book)
    add_label
  end

  def add_label
    puts
    puts "Create book's label"
    print 'Enter label title: '
    title = gets.chomp
    print 'Enter label color: '
    color = gets.chomp
    curr_label = Label.new(title, color)
    @labels.push(curr_label)
  end

  def fetch_data(file)
    if File.exist?("data/#{file}.json")
      File.read("data/#{file}.json")
    else
      empty_file = [].to_json
      File.write("data/#{file}.json", empty_file)
    end
  end

  def load_books_data
    books = JSON.parse(fetch_data('books'))
    new_books = []
    books.each do |book|
      new_books << Book.new(book['published_date'], book['publisher'], book['cover_state'])
    end
    new_books
  end

  def load_label_data
    labels = JSON.parse(fetch_data('label'))
    new_labels = []
    labels.each do |label|
      new_labels << Label.new(label['title'], label['color'])
    end
    new_labels
  end

  def save_book
    updated_books = []
    @books.each do |book|
      updated_books << { id: book.id, published_date: book.published_date, publisher: book.publisher,
                         cover_state: book.cover_state }
    end
    File.write('data/books.json', JSON.pretty_generate(updated_books))
  end

  def save_label
    updated_labels = []
    @labels.each do |label|
      updated_labels << { id: label.id, title: label.title, color: label.color }
    end
    File.write('data/label.json', JSON.pretty_generate(updated_labels))
  end

  def save_books_and_labels
    save_book
    save_label
  end

  def list_all_book
    puts 'No books entered' if @books.empty?
    @books.each_with_index do |book, index|
      puts "#{index + 1}) id: #{book.id}, Published date: #{book.published_date},
       Publisher #{book.publisher}, cover state: #{book.cover_state}"
    end
  end

  def list_all_labels
    puts 'No label added' if @labels.empty?
    @labels.each_with_index do |label, index|
      puts "#{index + 1}) Title: #{label.title}, Color: #{label.color}"
    end
  end
end
