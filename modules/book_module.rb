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
  end

  def add_label
    puts
    print 'Enter label title: '
    title = gets.chomp
    print 'Enter label color: '
    color = gets.chomp
    curr_label = Label.new(title, color)
    @labels.push(curr_label)
  end

  def list_all_book
    puts 'No books entered' if @books.empty?
    @books.each do |book|
      puts "[id]: #{book.id}, [Published date]: #{book.published_date},
       [Publisher] #{book.publisher}, [cover state]: #{book.cover_state}"
    end
  end

  def list_all_labels
    puts 'No label added' if @labels.empty?
    @labels.each do |label|
      puts "Title: #{label.title}, Color: #{label.color}"
    end
  end
end
