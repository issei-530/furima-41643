const pricecalculation =() =>{
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price")
    const price = inputValue;
    const taxRate = 0.1;
    const tax = Math.floor(price * taxRate);
    addTaxDom.innerHTML = tax;
    const addProfit = document.getElementById("profit")
    const profit = inputValue - tax;
    addProfit.innerHTML = profit;
  });
};

window.addEventListener("turbo:load", pricecalculation)
window.addEventListener("turbo:render", pricecalculation)


