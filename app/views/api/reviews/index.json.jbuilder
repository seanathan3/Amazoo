@reviews.each do |review|
    json.set! review.id do
       json.extract! review, :id, :rating, :title, :body, :commenter_id, :item_id 
    end
end