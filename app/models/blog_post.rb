class BlogPost < ApplicationRecord
    validates :title ,presence:true ,length: { minimum: 2, maximum: 30, message: "Should be between 2 and 30 characters" }
    validates :body , presence:true ,length: { minimum:5, message:"Should be more than 5 characters" }
end
