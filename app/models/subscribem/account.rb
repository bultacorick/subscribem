module Subscribem
  class Account < ActiveRecord::Base
    EXCLUDED_SUBDOMAINS = %w(admin)
    validates :subdomain, exclusion: {
      :in => EXCLUDED_SUBDOMAINS,
      :message => 'is not allowed. Please choose another subdomain.'
    }
    validates :subdomain, format: {
      :with => /\A[\w\-]+\z/i,
      :message => 'is not allowed. Please choose another subdomain.'
    }
    validates :subdomain, :presence => true, :uniqueness => true
    belongs_to :owner, :class_name => "Subscribem::User"
    accepts_nested_attributes_for :owner

    before_validation do
      self.subdomain = subdomain.to_s.downcase
    end
  end
end
