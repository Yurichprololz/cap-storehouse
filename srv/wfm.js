const cds = require('@sap/cds');
const constants = require('./constants');
const { getTotalPrice } = require('./helper');

const { Cars, Goods } = cds.entities('storehouse')
const { Allowance } = cds.entities('masterData')

async function approveGood(req) {

  try {
    const { ID: goodID } = req.params[0];
    const { car: carID } = req.data
    const car = await SELECT.one.from(Cars).where({ ID: carID })
    const good = await SELECT.one.from(Goods).where({ ID: goodID })
    const allowance = await SELECT.one.from(Allowance).where({ ID: good.allowance_ID })

    if (car.status_ID === '2') {
      return req.error(400, constants.errors.loadedCar)
    } else if (good.status_ID === '2') {
      return req.error(400, constants.errors.loadedGood)
    } else if (good.status_ID === '4') {
      return req.error(400, constants.errors.sendToApprove)
    }

    const payload = JSON.stringify({
      definitionId: "approvegood",
      context: {
        WorkflowDetails: {
          title: "Approving Good",
          comment: "Please Approve"
        },
        ApproveGood: {
          carID: car.ID,
          driverSurname: car.driverSurname,
          driverRating: car.driverRating,
          carName: car.carName,
          goodID: good.ID,
          goodName: good.name,
          quantity: good.quantity,
          price: good.price,
          totalPrice: getTotalPrice(good.price, good.quantity),
          currency_code: good.currency_code,
          allowanceName: allowance.name
        }
      }
    })
    const workflow = await cds.connect.to('WMF_SHOREHOUSE')
    await workflow.tx(req).post(
      '/rest/v1/workflow-instances',
      payload)
    return UPDATE(Goods, goodID).with({ status_ID: "4" })
  } catch (error) {
    console.log("Error of the WF instance creation: ", error)
  }
}


module.exports = { approveGood }
