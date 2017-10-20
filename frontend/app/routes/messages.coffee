import Ember from 'ember'
import RSVP from 'rsvp'

export default Ember.Route.extend(
  model: ->
    RSVP.hash
      messages: this.get('store').findAll('message')
      users: this.get('store').findAll('user')
)
