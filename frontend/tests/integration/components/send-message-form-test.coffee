import { test, moduleForComponent } from 'ember-qunit'
import hbs from 'htmlbars-inline-precompile'

moduleForComponent 'send-message-form', 'Integration | Component | send message form', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{send-message-form}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#send-message-form}}
      template block text
    {{/send-message-form}}
  """

  assert.equal @$().text().trim(), 'template block text'
