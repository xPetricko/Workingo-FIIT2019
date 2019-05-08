class Offer < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :category

  belongs_to :state
  belongs_to :province
  belongs_to :city

  default_scope -> { order(created_at: :desc) }

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




