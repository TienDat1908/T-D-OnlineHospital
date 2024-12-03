import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["row"];

  handleClick(event) {
    if (!event.target.closest("a")) {
      window.location.href = this.element.dataset.url;
    }
  }
}
