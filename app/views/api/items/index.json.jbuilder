@items.each do |item|
    json.set! item.id do
        json.extract! item, :id, :name, :animal_type, :price, :description, :rating
        json.photo_url item.photo.attached? ? item.photo.url : nil
    end
end