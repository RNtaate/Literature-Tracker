module GroupsHelper
  def display_edit_delete(partial)
    current_user == @group.user ? (render partial) : ''
  end
end
