class Comment < ApplicationRecord
  belongs_to :paper, counter_cache: true
  belongs_to :user
end
