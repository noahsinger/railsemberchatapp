import Ember from 'ember'

export default Ember.Controller.extend(
  # session is needed in the template to look for loggedin users 
  session: Ember.inject.service()
)
