# == Schema Information
#
# Table name: items
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  price       :float            not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  animal_type :string           not null
#  rating      :integer
#
class Item < ApplicationRecord
    validates :price, :description, :animal_type, presence: true
    validates :name, uniqueness: true, presence: true

    has_one_attached :photo

    has_many :cart_items,
        class_name: :CartItem,
        primary_key: :id,
        foreign_key: :item_id,
        dependent: :destroy

    has_many :reviews,
        class_name: :Review,
        primary_key: :id,
        foreign_key: :item_id,
        dependent: :destroy
end
