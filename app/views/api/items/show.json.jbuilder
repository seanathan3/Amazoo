json.item do
    json.extract! @item, :id, :name, :animal_type, :price, :description
    json.photo_url @item.photo.attached? ? @item.photo.url : nil
end

