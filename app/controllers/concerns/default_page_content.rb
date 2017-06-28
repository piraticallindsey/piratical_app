module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_filter :set_page_defaults
  end
  
  def set_page_defaults
    @page_title = 'Piratical App'
    @seo_keywords = 'Connor Lindsey Portfolio'
  end
end