window.addEventListener('load', function(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener('input', () => {
    const priceTax = document.getElementById("add-tax-price");
    priceTax.innerHTML = Math.round(priceInput.value * 0.1);
    const priceProfit = document.getElementById("profit");
    priceProfit.innerHTML = Math.round(priceInput.value - Math.round(priceInput.value * 0.1))
  })
});