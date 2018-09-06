const addAssociations = require('./../../hooks/add-associations');

module.exports = {
  before: {
    all: [],
    find: [
      addAssociations({
        models: [
          {
            model: 'client',
          }
        ]
      })
    ],
    get: [],
    create: [],
    update: [],
    patch: [],
    remove: []
  },

  after: {
    all: [],
    find: [],
    get: [],
    create: [],
    update: [],
    patch: [],
    remove: []
  },

  error: {
    all: [],
    find: [],
    get: [],
    create: [],
    update: [],
    patch: [],
    remove: []
  }
};
