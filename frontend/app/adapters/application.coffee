# application wide adapter

import DS from 'ember-data'

export default DS.JSONAPIAdapter.extend(
  # if in the future the rails provided api is put under it's own namespace,
  #  that namespace would need to be added here
  # namespace: ''

  # pluralize and underscore paths for types going to rails which
  #  doesn't want the default signular and hyphenated ember paths
  pathForType: (type) ->
    underscored = Ember.String.underscore(type)
    Ember.String.pluralize(underscored)
)
