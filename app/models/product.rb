class Product < ApplicationRecord
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true
  validates :image, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :status, presence: true
  validates :featured, presence: true, if: -> { featured.nil? }
  enum status: { available: 1, unavailable: 2 }

  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  belongs_to :productable, polymorphic: true
  has_one_attached :image
  has_many :wish_items

  include LikeSearchable
  include Paginatable
end
