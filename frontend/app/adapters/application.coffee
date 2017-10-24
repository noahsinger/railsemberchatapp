# application wide adapter

import DS from 'ember-data'

export default DS.RESTAdapter.extend(
  # if in the future the rails provided api is put under it's own namespace,
  #  that namespace would need to be added here
  # namespace: ''
)
