const arcadia = require('./arcadia/arcadia.service.js');
const client = require('./client/client.service.js');
const account = require('./account/account.service.js');
const bill = require('./bill/bill.service.js');
module.exports = function () {
  const app = this; // eslint-disable-line no-unused-vars
  app.configure(arcadia);
  app.configure(client);
  app.configure(account);
  app.configure(bill);
};
