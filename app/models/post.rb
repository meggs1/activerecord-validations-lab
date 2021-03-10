class Post < ActiveRecord::Base
    include ActiveModel::Validations
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, :inclusion => { :in => ['Fiction', 'Non-Fiction'] }
    validate :clickbait

    def clickbait
        clickbait_titles = ["Won't Believe","Secret","Top [number]","Guess"]
        if self.title.nil? || !clickbait_titles.any? {|phrase| self.title.include? phrase}
            errors.add(:title, "must be clickbait")
        end
    end

end
