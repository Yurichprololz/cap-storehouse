const cds = require('@sap/cds');
const { getTotalPrice } = require('./helper');

let { Cars, Goods } = cds.entities('storehouse');

const sendCar = async (req) => {

  try {
    const ID = req.params[0]
    const car = await SELECT.one.from(Cars).where({ ID })
    const good = await SELECT.one.from(Goods).where({ ID: car.good_ID })
    const totalPrice = getTotalPrice(good.price, good.quantity)

    const payload = JSON.stringify({
      carID: ID,
      goodID: good.ID,
      goodName: good.name,
      totalPrice: totalPrice,
      currencyCode: good.currency_code,
    })

    const cpi = await cds.connect.to('CPI_DESTINATION');
    await cpi.tx(req).post('/http/toLogistic', payload);
    await DELETE.from(Cars).where({ ID })
    return DELETE.from(Goods).where({ ID: good.ID })
  } catch (error) {
    console.log("Dispatch to CPI was not successful. Rejected with error: ", error)
  }

}

module.exports = { sendCar }