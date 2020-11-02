class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction or Non-Fiction) }
  validate :clickbaity_title

  def clickbaity_title
    #     matches = [
    #       /won't believe/i,
    #       /secret/i,
    #       /top\s[0-9]+/i,
    #       /guess/i,
    #     ].reduce(false) { |mem, pat| mem || pat.match(self.title) }
    #     if !matches
    #       errors.add(:title, "bad title")
    #     end
    #   end

    if /Won't Believe/i.match(self.title)
      return
    end
    if /Secret/i.match(self.title)
      return
    end
    if /Top\s[0-9]+/i.match(self.title)
      return
    end
    if /Guess/i.match(self.title)
      return
    end
    errors.add(:title, "Sorry, go read an actual book!")
  end
end
