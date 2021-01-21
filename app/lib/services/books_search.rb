class ::Services::BooksSearch
  def initialize(params)
    @books = Book.all
    @params = params
  end

  def query
    filter_title(params[:title])
    filter_author(params[:author])
    filter_genre(params[:genre])
    filter_publisher(params[:publisher])

    books
  end

  attr_reader :books, :params

  private

  attr_writer :books


  def filter_title(title)
    return if title.nil?

    self.books = self.books.where("title ILIKE ?", '%' + title + '%')
  end

  def filter_author(author)
    return if author.nil?

    self.books = self.books.where("author ILIKE ?", '%' + author + '%')
  end

  def filter_genre(genre)
    return if genre.nil?

    self.books = self.books.where("genre ILIKE ?", '%' + genre + '%')
  end

  def filter_publisher(publisher)
    return if publisher.nil?

    self.books = self.books.where("publisher ILIKE ?", '%' + publisher + '%')
  end
end
