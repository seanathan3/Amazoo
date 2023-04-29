json.review do
    json.extract! @review, :id, :rating, :body, :commenter_id, :item_id
end

