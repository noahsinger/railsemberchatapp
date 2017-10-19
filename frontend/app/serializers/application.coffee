# app serializer for translating object attributes

import DS from 'ember-data'

# convert attributes to use underscores instead of hyphens (rails vs ember)
export default DS.JSONAPISerializer.extend(
  keyForAttribute: (attr) ->
    Ember.String.underscore(attr)

  keyForRelationship: (key) ->
    Ember.String.underscore(key)
)
