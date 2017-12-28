class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'

  attributes :nickname, :loggedin, :created_at, :updated_at

  has_many :messages
end
