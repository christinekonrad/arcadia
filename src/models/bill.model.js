// See http://docs.sequelizejs.com/en/latest/docs/models-definition/
// for more of what you can do here.
const Sequelize = require('sequelize');
const DataTypes = Sequelize.DataTypes;

module.exports = function (app) {
  const sequelizeClient = app.get('sequelizeClient');
  const bill = sequelizeClient.define('bill', {
    createdAt: {
      type: DataTypes.DATE,
      field: 'created_at'
    },
    updatedAt: {
      type: DataTypes.DATE,
      field: 'updated_at'
    },
    start_date: {
      type: DataTypes.DATEONLY,
    },
    end_date: {
      type: DataTypes.DATEONLY,
    },
    usage: {
      type: DataTypes.INTEGER,
    },
    charges: {
      type: DataTypes.DECIMAL,
    },
    status : {
      type: DataTypes.CHAR
    } 
  }, {
    hooks: {
      beforeCount(options) {
        options.raw = true;
      }
    }
  });

  bill.associate = function (models) { // eslint-disable-line no-unused-vars
    // Define associations here
    // See http://docs.sequelizejs.com/en/latest/docs/associations/
    bill.belongsTo(models.account, {foreignKey: 'account_id'});
  };

  return bill;
};
