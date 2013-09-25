class Leaf
  include Mongoid::Document
  belongs_to :sub_directory
  field :description, type: String
  field :filename, type: String
  field :type, type: String
  field :timestamp, type: Time
end