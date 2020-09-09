function price() {
  const inputprice = document.getElementById("item-price");
  const pricetax = document.getElementById("add-tax-price");
  const priceprofit = document.getElementById("profit");

  inputprice.addEventListener('input', function() {
    const value = inputprice.value;

    if (value >= 300 && value <= 9999999){
      let fee = value * 0.1
      let gains = value - fee
      pricetax.textContent = Math.floor( fee );
      priceprofit.textContent = Math.floor( gains );
    } 
    else{
      let fee = '-';
      let gains = '-';
      pricetax.textContent = fee;
      priceprofit.textContent = gains;
    }
  });
}
window.addEventListener("load", price);