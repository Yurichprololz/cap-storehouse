const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {

    let { Cars } = this.entities;

    this.before('NEW', 'Cars', async (req) => {
        req.data.ID = '1';
    });
    this.on('loadCar', 'Goods', async (req) => {
        console.log(req.data)
    });

})


