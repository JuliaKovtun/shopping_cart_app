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
      location.reload();
    });
  }
}
