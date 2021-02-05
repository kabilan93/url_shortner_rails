class Link < ApplicationRecord
    attr_readonly :slug

    validates_presence_of :url
    URL_REGEXP = /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix
    validates :url, format: { with: URL_REGEXP, message: 'provided is invalid, failed to shortern. Please try again with proper url syntax.' }
    validates_uniqueness_of :slug
    before_validation :generate_slug
    
    def generate_slug
        self.slug = SecureRandom.uuid[0..5]
        if !Link.exists?(slug: self.slug)
            return self.slug
        end
    end
end
