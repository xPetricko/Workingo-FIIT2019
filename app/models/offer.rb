class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :category

  belongs_to :state
  belongs_to :province
  belongs_to :city

  default_scope -> { order(created_at: :desc) }


  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

end
