class City < ApplicationRecord
  belongs_to :state
  belongs_to :province
  has_many :offers

end
