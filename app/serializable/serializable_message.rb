class SerializableMessage < JSONAPI::Serializable::Resource
  type 'messages'

  attributes :content, :created_at, :updated_at

  has_one :user
end
