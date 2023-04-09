@cart_items.each do |cart_item|
    json.set! cart_item.id do
        json.extract! cart_item, :id, :quantity, :user_id, :item_id
        json.photo_url cart_item.item.photo.attached? ? cart_item.item.photo.url : nil
    end
end