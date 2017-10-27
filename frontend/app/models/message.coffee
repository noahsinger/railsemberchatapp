import DS from 'ember-data'

export default DS.Model.extend {
  content: DS.attr 'string'
  user_id: DS.attr 'number'
  user: DS.belongsTo 'user', {async: true}
}
