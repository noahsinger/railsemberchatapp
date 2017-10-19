# set standard seriealizer to be the jsonapi Serializer for ember compatibility

ActiveModel::Serializer.config.adapter =
  ActiveModel::Serializer::Adapter::JsonApi
