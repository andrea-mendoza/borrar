class Paper < ApplicationRecord
    has_many :comments
    has_many :reviews
    
    belongs_to :user
    alias_attribute :author, :user
    
    belongs_to :event
    
    has_one :assingment
    has_one :classroom
    
    has_one_attached :pdf_file
    acts_as_taggable

    # paginates_per 6

    after_update :send_notification

    def send_notification
        PaperMailer.status_notification(self.user, self, self.event).deliver
    end
end
