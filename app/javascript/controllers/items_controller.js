import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  delete(event) {
    let confirmation = confirm("Do you want to delete this item ?");
    if (!confirmation) {
      event.preventDefault()
    }
  }
}
