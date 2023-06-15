import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="ajax"
export default class extends Controller {
  static targets = ["form", "list", "input"]

  connect() {
    console.log(this.formTarget)
    console.log(this.listTarget)
    console.log(this.inputTarget)
  }

  searching() {
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, {headers: {"Accept": "text/plain"}})
    .then(response => response.text())
    .then((data) => {
      console.log(data)
      this.listTarget.innerHTML = data
    })
  }
}
