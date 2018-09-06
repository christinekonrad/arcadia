// Initializes the `account` service on path `/account`
const createService = require('feathers-sequelize');
const createModel = require('../../models/account.model');
const hooks = require('./account.hooks');
const filters = require('./account.filters');

module.exports = function () {
  const app = this;
  const Model = createModel(app);
  const paginate = app.get('paginate');

  const options = {
    name: 'account',
    Model,
    paginate
  };

  // Initialize our service with any options it requires
  app.use('/account', createService(options));

  // Get our initialized service so that we can register hooks and filters
  const service = app.service('account');

  service.hooks(hooks);

  if (service.filter) {
    service.filter(filters);
  }
};
