import DS from 'ember-data'

export default DS.Model.extend {
  nickname: DS.attr 'string'
  loggedin: DS.attr 'boolean'

  # even though users have many messages, we don't need to load all of
  #  them on the client
  # messages: DS.hasMany 'message'
}
