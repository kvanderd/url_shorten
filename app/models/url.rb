class Url < ActiveRecord::Base
  # Remember to create a migration!
  validates :long, :presence => true
  validates_format_of :long, :with => URI::regexp(%w(http https))
end
