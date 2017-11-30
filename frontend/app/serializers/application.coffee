# app serializer for translating object attributes
#  for output to rails as REST data

import DS from 'ember-data'

export default DS.JSONAPISerializer.extend(
  # underscore attribute names for rails, user_id instead of user-id
  keyForAttribute: (key) ->
    Ember.String.underscore(key)
)
