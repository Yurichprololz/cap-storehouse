const cds = require('@sap/cds');
const cpi = require('./sendCar.cpi')
const wfm = require('./wfm')

module.exports = cds.service.impl(async function () {

    this.before('NEW', 'Cars', async (req) => {
        req.data.ID = '1';
    });
    this.before('NEW', 'Goods', (req) => {
        req.data.status_ID = '1';
    });

    this.on('loadCar', 'Goods', wfm.approveGood);

    this.on('sendCar', 'Cars', cpi.sendCar);

    this.after('READ', 'Goods', (each) => {
        if (each.status?.ID == '1' || each.status?.ID == '3') {
            each.loadCarEnabled = true;
        }
    })


    this.after('READ', 'Cars', (each) => {
        if (each.status_ID === '2') {
            each.sendCarEnabled = true
        }
    })

})


