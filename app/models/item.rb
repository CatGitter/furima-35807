class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :delivery_day

  belongs_to :user
  has_one    :order
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :title
    validates :description
    validates :price, numericality: true, inclusion: {in:300..9999999}
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :prefecture_id
    validates :delivery_day_id
  end
end
