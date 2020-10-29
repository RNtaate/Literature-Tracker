module BooksHelper
  def display_books_list(books)
    books_list = ''

    books.each do |book|
      books_list << "
      <a href=\"#{book_path(book)}\">
        <div class=\"list-item\">

          #{display_outer_book_image(book, '/assets/group2.png', '/assets/ungrouped3.jpg')}

          <div class=\"list-item-details name-date\">
            <p>#{book.name} </p>
            <small>#{book.created_at.strftime('%B %d, %Y')}</small>
          </div>

          <div class=\"list-item-details meta-details\">
            <h4>$ #{book.amount}</h4>
            <h4>#{book.time} hrs</h4>
          </div>
        </div>
      </a>"
    end
    books_list.html_safe
  end
end
