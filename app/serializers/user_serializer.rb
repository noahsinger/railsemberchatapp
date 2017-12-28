class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'

  attributes :nickname, :loggedin

  has_many :messages
end
