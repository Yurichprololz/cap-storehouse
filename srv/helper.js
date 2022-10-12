const getTotalPrice = (price, quantity) => ((parseFloat(price) * 100 * quantity) / 100).toFixed(2)

module.exports = { getTotalPrice }