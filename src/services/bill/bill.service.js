// Initializes the `bill` service on path `/bill`
const createService = require('feathers-sequelize');
const createModel = require('../../models/bill.model');
const hooks = require('./bill.hooks');
const filters = require('./bill.filters');

module.exports = function () {
  const app = this;
  const Model = createModel(app);
  const paginate = app.get('paginate');

  const options = {
    name: 'bill',
    Model,
    paginate
  };

  // Initialize our service with any options it requires
  app.use('/bill', createService(options));

  // Get our initialized service so that we can register hooks and filters
  const service = app.service('bill');

  service.hooks(hooks);

  if (service.filter) {
    service.filter(filters);
  }
};
