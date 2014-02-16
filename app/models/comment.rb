class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  attr_accessible :body, :post

  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true
  validates :post, presence: true

  after_create :send_favorite_emails

  default_scope order('updated_at DESC')

  private

  def send_favorite_emails
    # for every favorite associated with post, send email
  	self.post.favorites.each do |favorite|
  		FavoriteMailer.new_comment(favorite.user, self.psot, self).deliver

      if favorite.user_id != self.user_id && favorite.user.email_favorites?
        FavoriteMailer.new_comment(favorite.user, self.post, self).deliver
      end
  	end
  end
end
