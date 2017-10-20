class UserSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :loggedin
end
