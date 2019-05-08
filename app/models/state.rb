class State < ApplicationRecord
has_many :provinces
has_many :cities
has_many :offers
end
