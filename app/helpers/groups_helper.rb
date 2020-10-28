module GroupsHelper
  def display_edit_delete(partial)
    current_user == @group.user ? (render partial) : ''
  end

  def display_groups_list(groups)
    groups_list = ''

    groups.each do |group|
      groups_list << "
      <a href=\"#{group_path(group)}\">
        <div class=\"list-item\">

          #{display_group_image(group, '/assets/group2.png')}

          <div class=\"list-item-details name-date\">
            <p>#{group.name}</p>
            <small>#{group.created_at.strftime("%B %d, %Y")}</small>
          </div>

          <div class=\"list-item-details meta-details\">
            <h4>$#{get_my_sum(group.books.where_id_is(current_user.id), 'amount') }</h4>
            <h4>#{get_my_sum(group.books.where_id_is(current_user.id), 'time')} hrs</h4>
          </div>
        </div>

        </div>
      </a>"
    end
    groups_list.html_safe
  end

  def groups_list_show(group)
    books_list = ''

    group.books.each do |book|
      books_list << "
      <div class=\"list-item\">

       #{display_group_image(group, '/assets/group2.png') }

       <div class=\"list-item-details book-name-date\">
         <p>#{ book.name }</p>
         <small>Bought by <span>#{book.author.name }</span></small>
       </div>

      </div>"
    end
    books_list.html_safe
  end
end
