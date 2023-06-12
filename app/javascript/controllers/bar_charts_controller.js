import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bar-charts"
export default class extends Controller {
  connect() {
    console.log("hello")
  }
}
