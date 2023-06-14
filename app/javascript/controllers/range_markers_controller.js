import { Controller } from "@hotwired/stimulus"
import { clippingParents } from "@popperjs/core"

// Connects to data-controller="range-markers"
export default class extends Controller {
  static targets = [ "flexibility", "muscularEffort", "breathDifficulty", "flexibilityMarker"]
  connect() {
    const flexibilityValues = this.getMinMaxValues(this.flexibilityTarget)
    const flexibilitySpan = document.createElement("span")
    this.flexibilityMarkerTarget.appendChild(flexibilitySpan)
    flexibilitySpan.textContent = flexibilityValues[0]

    const muscularEffortValues = this.getMinMaxValues(this.muscularEffortTarget)
    const muscularEffortSpan = document.createElement("span")
    this.muscularEffortMarkerTarget.appendChild(muscularEffortSpan)
    muscularEffortSpan.textContent = muscularEffortValues[0]





  }

  getMinMaxValues(target) {
    const minValue = parseInt(target.min)
    const maxValue = parseInt(target.max)

    return [minValue, maxValue]
  }


}
