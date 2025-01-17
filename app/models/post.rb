class Post < ActiveRecord::Base
  validates :title, presence: true
  validates_length_of :content, minimum: 250
  validates_length_of :summary, maximum: 250
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :is_clickbait?

  CLICKBAIT = [/Won't Believe/i, /Secret/i, /Top \d+/i, /Guess/i]

 def is_clickbait?
   if CLICKBAIT.none?{|pat| pat.match title}
     errors.add(:title, "must be clickbait")
   end
 end

end
