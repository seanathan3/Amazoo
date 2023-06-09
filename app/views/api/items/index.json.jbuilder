@items.each do |item|
    json.set! item.id do
        json.extract! item, :id, :name, :animal_type, :price, :description
        json.photo_url item.photo.attached? ? item.photo.url : nil
        json.avg_rating item.reviews.average(:rating)
        json.num_reviews item.reviews.count
    end
end