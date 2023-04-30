@reviews.each do |review|
    json.set! review.id do
       json.extract! review, :id, :rating, :body, :commenter_id, :item_id 
    end
end