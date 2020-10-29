module ApplicationHelper
  def display_book_image(book, image1)
    if book.groups.first.image.attached?
      content_tag(:div, nil, class: 'image-div',
                             style: "background-image: url(#{rails_blob_url(book.groups.first.image)})")
    else
      content_tag(:div, nil, class: 'image-div', style: "background-image: url(#{image1})")
    end
  end

  def display_outer_book_image(book, image1, image2)
    if !book.groups.empty?
      display_book_image(book, image1)
    else
      content_tag(:div, nil, class: 'image-div', style: "background-image: url(#{image2})")
    end
  end

  def display_group_image(group, image1)
    if group.image.attached?
      content_tag(:div, nil, class: 'image-div', style: "background-image: url(#{rails_blob_url(group.image)})")
    else
      content_tag(:div, nil, class: 'image-div', style: "background-image: url(#{image1})")
    end
  end

  def display_user_image(user, div_type, image1)
    if user.image.attached?
      content_tag(:div, nil, class: div_type.to_s, style: "background-image: url(#{rails_blob_url(user.image)})")
    else
      content_tag(:div, nil, class: div_type.to_s, style: "background-image: url(#{image1})")
    end
  end

  def get_my_sum(list, column_name)
    list.sum(column_name)
  end

  def form_errors(model)
    if model.errors.any?
      content_tag :div, id: 'error_explanation' do
        content_tag(:h2, "#{pluralize(model.errors.count, 'error')} prohibited this book from being saved:") +
          content_tag(:ul) do
            model.errors.full_messages.each do |message|
              concat(content_tag(:li, message.to_s))
            end
          end
      end
    else
      ''
    end
  end
end
