@items.each do |item|
    json.set! item.id do
        json.extract! item, :id, :name, :animal_type, :price, :description
    end
end