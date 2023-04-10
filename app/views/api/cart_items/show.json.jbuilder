json.extract! @cart_item, :id, :quantity, :user_id, :item_id
json.name @cart_item.item.name
json.type @cart_item.item.animal_type
json.price @cart_item.item.price
json.photo_url @cart_item.item.photo.attached? ? @cart_item.item.photo.url : nil