import Ember from 'ember'
import RSVP from 'rsvp'

export default Ember.Route.extend(
  session: Ember.inject.service()

  model: ->
    RSVP.hash
      # peek to only load messages already in the store
      messages: this.get('store').peekAll('message')
      users: this.get('store').findAll('user')

  actions:
    logout: ->
      console.log('logging user out')
      this.get('session').logout()
)
