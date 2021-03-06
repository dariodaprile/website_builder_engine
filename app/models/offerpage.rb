class Offerpage
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, :type => String
  field :filename, :type => String
  field :description, :type => String
  field :keywords, :type => String
  field :image_url, :type => String
  field :headline, :type => String
  field :subhead, :type => String
  field :content_block1, :type => String
  field :content_block2, :type => String
  field :offer_block, :type => String
  field :testimonials, :type => String
  field :video, :type => String
  field :published, :type => Boolean
end
