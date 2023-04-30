# @cart_items.each do |cart_item|
#     json.set! cart_item.id do
#         json.extract! cart_item, :id, :quantity, :user_id, :item_id
#         json.name cart_item.item.name
#         json.type cart_item.item.animal_type
#         json.price cart_item.item.price
#         json.photo_url cart_item.item.photo.attached? ? cart_item.item.photo.url : nil
#     end
# end
items = []
json.cart_items do
    @cart_items.each do |cart_item|
        items << cart_item.item
        json.set! cart_item.id do
            json.extract! cart_item, :id, :quantity, :user_id, :item_id
        end
    end
end

json.items do
    items.each do |item|
        json.set! item.id do
            json.extract! item, :id, :name, :animal_type, :price
            json.photo_url item.photo.attached? ? item.photo.url : nil
        end
    end
end
