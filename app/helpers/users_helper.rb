module UsersHelper
  def display_users_list(users)
    users_list = ''
    users.each do |user|
      users_list << "
      <a href='#{reader_path(user)}'>
        <div class='list-item'>

          #{display_user_image(user, 'image-div', '/assets/group2.png')}

          <h4 class='list-item-details book-name-date'>#{user.name}</h4>
        </div>
      </a>"
    end

    users_list.html_safe
  end

  def display_reader(user)
    single_user = ''

    user.books.each do |book|
      single_user << "
      <div class='list-item'>
        <div class='list-item-details group-name-date'>
            <p>'#{book.name}'</p>
            <small>Author: <span>#{book.book_author}</span></small>
          </div>
        </div>
      </div>"
    end

    single_user.html_safe
  end
end
