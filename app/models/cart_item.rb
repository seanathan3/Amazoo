# == Schema Information
#
# Table name: cart_items
#
#  id         :bigint           not null, primary key
#  quantity   :integer          not null
#  user_id    :bigint           not null
#  item_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CartItem < ApplicationRecord
    validates :quantity, :user_id, :item_id, presence: true

    belongs_to :user,
        class_name: :User,
        primary_key: :id,
        foreign_key: :user_id

    belongs_to :item,
        class_name: :Item,
        primary_key: :id,
        foreign_key: :item_id
end
