class Topic < ActiveRecord::Base
    has_many :posts, :sponsored_posts, dependent: :destroy
end
