class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :where_id_is, ->(id) {where('author_id = ?', id)}
end
