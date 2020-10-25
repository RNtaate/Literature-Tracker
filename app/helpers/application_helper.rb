module ApplicationHelper

  def display_book_image(book, image1)
    if book.groups.first.image.attached?
      content_tag(:div, nil, class: 'image-div', style: "background-image: url(#{rails_blob_url(book.groups.first.image)})")
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
      content_tag(:div, nil, class: "#{div_type}", style: "background-image: url(#{rails_blob_url(user.image)})")
    else
      content_tag(:div, nil, class: "#{div_type}", style: "background-image: url(#{image1})")
    end
  end
end
