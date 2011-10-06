module WebsiteBuilderEngine
  class ApplicationController < ActionController::Base
    include FrontendHelpers::Html5Helper
    
    protected    
      def get_settings
        @settings = Setting.first
        @docroot_path = "#{Rails.root}/public/"
        @file_path = "#{@docroot_path}#{@settings.articles_directory}/"
        @url_path = "/#{@settings.articles_directory}/"
      end
  end
end
