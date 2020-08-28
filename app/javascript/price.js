
window.addEventListener('load', function(){
  const prices = document.getElementById("item-price");
  const fee = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  
  prices.addEventListener('keyup', function(){
      const value = prices.value;

      let tax = Math.floor(value * 0.1)
      let gains = value - tax
      fee.textContent = tax;
      profit.textContent = gains;
  })
})

