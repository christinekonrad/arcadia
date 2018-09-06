const assert = require('assert');
const app = require('../../src/app');

describe('\'arcadia\' service', () => {
  it('registered the service', () => {
    const service = app.service('arcadia');

    assert.ok(service, 'Registered the service');
  });
});
