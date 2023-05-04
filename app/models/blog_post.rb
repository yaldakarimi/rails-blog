class BlogPost < ApplicationRecord
    validates :title ,presence:true ,length: { minimum: 2, maximum: 60, message: "Should be between 2 and 60 characters" }
    validates :body , presence:true ,length: { minimum:5, message:"Should be more than 5 characters" }

    scope :sorted, -> { order(published_at: :desc, updated_at: :desc)}
    scope :draft, -> { where(published_at: nil)}
    scope :scheduled, -> {where("published_at >= ?" , Time.current)}
    scope :published, -> {where("published_at < ?" , Time.current)}

    # In this code, published_at? is a shorthand way to check if the published_at attribute is present (i.e., not nil or false). The ? at the end of the method name is a convention in Ruby to indicate that the method returns a boolean value, i.e., either true or false. So, in this case, the draft? method returns true if the published_at attribute is present (i.e., the post is not a draft), and false otherwise (i.e., the post is a draft).

    def draft?
        published_at.nil?
    end

    def published?
        published_at? && published <= Time.current
    end

    def scheduled?
        published_at? && published_at > Time.current
    end

end
