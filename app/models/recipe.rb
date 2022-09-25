class Recipe < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  has_many :recipe_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :genre
  has_many :ingredients, dependent: :destroy
  has_many :cooking_methods, dependent: :destroy
  accepts_nested_attributes_for :ingredients, :cooking_methods, allow_destroy: true

  validates :name, presence: true
  validates :recipe_explanation, presence: true
  validates :serving, presence: true
  validates :point_explanation, presence: true

  def get_image
    unless image.attached?
      file_path = Rails.root.join('public/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
