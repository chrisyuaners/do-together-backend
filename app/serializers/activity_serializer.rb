class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :title, :location, :events, :groups, :users, :image, :icon
  has_many :users, include_nested_associations: true
end
