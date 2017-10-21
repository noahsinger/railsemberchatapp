import Ember from 'ember'
import RSVP from 'rsvp'

export default Ember.Route.extend(
  session: Ember.inject.service()

  model: ->
    RSVP.hash
      messages: this.get('store').findAll('message')
      users: this.get('store').findAll('user')

  actions:
    logout: ->
      console.log('logging user out')
      this.get('session').logout()
)
