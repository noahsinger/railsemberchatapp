import DS from 'ember-data'
import EmberObject, { computed } from '@ember/object';

export default DS.Model.extend {
  session: Ember.inject.service( )

  nickname: DS.attr 'string'
  loggedin: DS.attr 'boolean'

  # even though users have many messages, we don't need to load all of
  #  them on the client
  # messages: DS.hasMany 'message'

  isCurrentUser: computed('id', ->
    console.log("computing user")
    this.get('session').get('current_user') == this
  )
}
