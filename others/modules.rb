module ImageUtils
  def self.included(base)
    base.extend(ClassMethods)
  end

  def preview
  end

  module ClassMethods
    def fetch_from_twitter(user)
    end

    def clean_up; end
  end
end

module ImageProcessing
  extend ActiveSupport::Concern
  include ImageUtils

  def self.included(base)
    base.clean_up
  end
end

class Image
  include ImageProcessing
end

image = Image.new
image.preview

Image.fetch_from_twitter('gregg')

###### Using ActiveSupport::Concern ######

module ImageUtils
  extend ActiveSupport::Concern

  module ClassMethods
    def clean_up; end    
  end
end

module ImageProcessing
  extend ActiveSupport::Concern
  include ImageUtils

  included do
    clean_up
  end
end
