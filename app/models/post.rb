class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :click_bait_validator

  def click_bait_validator
    bait = ["Guess", "Won't", "Believe", "Secret", "Top"]
    if title && (bait & self.title.split(" ")).empty?
      errors.add(:title, "must be clickbait")
    end
  end

end
