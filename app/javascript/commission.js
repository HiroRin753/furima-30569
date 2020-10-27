document.addEventListener('DOMContentLoaded', function() {
   const priceInput = document.getElementById('item-price');
   priceInput.addEventListener("input", () => {
      console.log("イベント発火");
   })



