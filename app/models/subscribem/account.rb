module Subscribem
  class Account < ActiveRecord::Base
    EXCLUDED_SUBDOMAINS = %w(admin)
    validates :subdomain, :presence => true, :uniqueness => true
    validates :subdomain, exclusion: {
      :in => EXCLUDED_SUBDOMAINS,
      :message => 'is not allowed. Please choose another subdomain.'
    }
    validates :subdomain, format: {
      :with => /\A[\w\-]+\z/i,
      :message => 'is not allowed. Please choose another subdomain.'
    }
    has_many :members, :class_name => "Subscribem::Member"
    has_many :users, :through => :members
    
    belongs_to :owner, :class_name => "Subscribem::User"
    accepts_nested_attributes_for :owner

    before_validation do
      self.subdomain = subdomain.to_s.downcase
    end

    def self.create_with_owner(params={})
      account = new(params)
      if account.save
        account.users << account.owner
      end
      account
    end
  end
end
