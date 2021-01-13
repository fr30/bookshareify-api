class ::Services::BooksSearch
  def initialize(params)
    @books = Book.all
    @params = params
  end

  def query
    filter_title(params[:title])
    filter_author(params[:author])

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
end
