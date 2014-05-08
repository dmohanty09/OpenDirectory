class User
  include Mongoid::Document
  has_many :leafs
  field :name, type: String
end