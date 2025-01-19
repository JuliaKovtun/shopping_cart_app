import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  update(event) {
    const cartItemId = event.target.dataset.cartItemId;
    const quantity = event.target.value;

    fetch(`/cart_items/${cartItemId}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
      },
      body: JSON.stringify({ quantity: quantity }),
    }).then(() => {
      location.reload(); // For simplicity, reload the page
    });
  }
  applyDiscount(event) {
    const discount = event.target.value;
    const discountValueElement = document.getElementById("discount-value");
    const totalAmountElement = document.getElementById("total-amount");

    // Update discount value display
    discountValueElement.innerText = discount;

    // Update total amount
    const originalAmount = parseFloat(totalAmountElement.dataset.originalAmount);
    const discountedAmount = originalAmount - discount;
    totalAmountElement.innerText = `$${discountedAmount.toFixed(2)}`;
  }  
}
