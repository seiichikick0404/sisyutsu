class Purchase < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  # バリデーション
  with_options presence: true do
    validates :text
    validates :price
    validates :category_id
  end
end
