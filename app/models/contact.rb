class Contact
  include Mongoid::Document
  field :first_name, :type => String
  field :last_name, :type => String
  validates_presence_of :first_name
  validates_presence_of :last_name
end
