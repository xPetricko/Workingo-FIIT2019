class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :category

  belongs_to :state
  belongs_to :province
  belongs_to :city

  has_many :accepted_offers, dependent: :destroy


  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }


  def category_name
    User.all
    category.try(:name)
  end

  def category_name=(name)
    User.all
    self.category = Category.find_or_create_by(name: name) if name.present?
  end

end




