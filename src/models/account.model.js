// See http://docs.sequelizejs.com/en/latest/docs/models-definition/
// for more of what you can do here.
const Sequelize = require('sequelize');
const DataTypes = Sequelize.DataTypes;

module.exports = function (app) {
  const sequelizeClient = app.get('sequelizeClient');
  const account = sequelizeClient.define('account', {
    createdAt: {
      type: DataTypes.DATE,
      field: 'created_at'
    },
    updatedAt: {
      type: DataTypes.DATE,
      field: 'updated_at'
    },
    utility: {
      type: DataTypes.CHAR,
    },
    account_type: {
      type: DataTypes.CHAR,
    },
    account_number: {
      type: DataTypes.CHAR,
    },
  }, {
    hooks: {
      beforeCount(options) {
        options.raw = true;
      }
    },
  });

  account.associate = function (models) { // eslint-disable-line no-unused-vars
    // Define associations here
    // See http://docs.sequelizejs.com/en/latest/docs/associations/
    account.belongsTo(models.client, {foreignKey: 'client_id'});
  };

  return account;
};
