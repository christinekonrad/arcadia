const assert = require('assert');
const app = require('../../src/app');

describe('\'bill\' service', () => {
  it('registered the service', () => {
    const service = app.service('bill');

    assert.ok(service, 'Registered the service');
  });
});
