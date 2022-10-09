const cds = require('@sap/cds');
const constansts = require('./constants')
const cpi = require('./sendCar.cpi')

module.exports = cds.service.impl(async function () {

    let { Cars, Goods } = this.entities;

    this.before('NEW', 'Cars', async (req) => {
        req.data.ID = '1';
    });
    this.before('NEW', 'Goods', (req) => {
        req.data.status_ID = '1';
    });

    this.on('loadCar', 'Goods', async (req) => {

        const { car: carID } = req.data
        const car = await SELECT.one.from(Cars).where({ ID: carID })
        if (car.status_ID === '2') {
            throw new Error('Error: ' + constansts.errors.loadedCar)
        }
        const { ID: goodID } = req.params[0];

        await UPDATE(Cars).where({ ID: carID }).with({ status_ID: '2', good_ID: goodID })
        return UPDATE(Goods).where({ ID: goodID }).with({ status_ID: '2' })
    });

    this.on('sendCar', 'Cars', cpi.sendCar);

    this.after('READ', 'Goods', (each) => {
        if (each.status_ID == '1' || each?.status?.ID == '1') {
            each.loadCarEnabled = true;
        }
    })


    this.after('READ', 'Cars', (each) => {
        if (each.status_ID === '2') {
            each.sendCarEnabled = true
        }
    })

})


