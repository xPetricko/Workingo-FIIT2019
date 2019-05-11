class Category < ApplicationRecord
  has_many :offers

  default_scope -> { order(name: :asc) }

end
