import { moduleFor, test } from 'ember-qunit'

moduleFor 'service:session', 'Unit | Service | session', {
  # Specify the other units that are required for this test.
  # needs: ['service:foo']
}

# Replace this with your real tests.
test 'it exists', (assert) ->
  service = @subject()
  assert.ok service