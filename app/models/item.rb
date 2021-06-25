class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :delivery_day

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :title
    validates :description
    validates_inclusion_of :price, in:300..9999999
  end
  validates :category_id,     numericality: { other_than: 1 }
  validates :status_id,       numericality: { other_than: 1 }
  validates :burden_id,       numericality: { other_than: 1 }
  validates :prefecture_id,   numericality: { other_than: 1 }
  validates :delivery_day_id, numericality: { other_than: 1 }

end
