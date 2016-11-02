class Post < ApplicationRecord
  default_scope { order(votes_count: :desc) }

  belongs_to :user
  belongs_to :category

  has_many :votes
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  before_validation :smart_add_url_protocol
  validates :url, uniqueness: true
  validates :url, format: { with: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix }
  validates :user, :title, :url, presence: true


  def tag_names
    tags.collect(&:name).join(", ")
  end

  protected

  # Found regular expressions and the method below on Stack Overflow because writing them is awful. But I know what they're doing, so there's that..

  def smart_add_url_protocol
    unless self.url[/\Ahttp:\/\//] || self.url[/\Ahttps:\/\//]
      self.url = "https://#{self.url}"
    end
  end

end
