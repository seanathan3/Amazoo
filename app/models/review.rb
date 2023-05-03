# == Schema Information
#
# Table name: reviews
#
#  id           :bigint           not null, primary key
#  rating       :integer          not null
#  body         :text
#  commenter_id :bigint           not null
#  item_id      :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Review < ApplicationRecord

    validates :commenter_id, :item_id, :rating, presence: true

    validates :rating, numericality: { in: 1..5 }

    validates :title, :body, length: { minimum: 1 }

    belongs_to :item,
        class_name: :Item,
        primary_key: :id,
        foreign_key: :item_id

    belongs_to :commenter,
        class_name: :User,
        primary_key: :id,
        foreign_key: :commenter_id

end
