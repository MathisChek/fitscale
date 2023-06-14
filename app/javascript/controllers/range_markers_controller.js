import { Controller } from "@hotwired/stimulus"
import { clippingParents, createPopper } from "@popperjs/core"

// Connects to data-controller="range-markers"
export default class extends Controller {
  static targets = [ "flexibility", "muscularEffort", "breathDifficulty", "flexibilityMarker",
                      "muscularEffortMarker", "breathDifficultyMarker" ]

  connect() {
    const flexibilityValues = this.getRangeValues(this.flexibilityTarget)

    this.addMinValue(flexibilityValues[0], this.flexibilityMarkerTarget)
    this.addMidValue(flexibilityValues[1], this.flexibilityMarkerTarget)
    this.addMaxValue(flexibilityValues[2], this.flexibilityMarkerTarget)

    const muscularEffortValues = this.getRangeValues(this.muscularEffortTarget)

    this.addMinValue(muscularEffortValues[0], this.muscularEffortMarkerTarget)
    this.addMidValue(muscularEffortValues[1], this.muscularEffortMarkerTarget)
    this.addMaxValue(muscularEffortValues[2], this.muscularEffortMarkerTarget)

    const breathDifficultyValues = this.getRangeValues(this.breathDifficultyTarget)

    this.addMinValue(breathDifficultyValues[0], this.breathDifficultyMarkerTarget )
    this.addMidValue(breathDifficultyValues[1], this.breathDifficultyMarkerTarget)
    this.addMaxValue(breathDifficultyValues[2], this.breathDifficultyMarkerTarget)

  }

  getRangeValues(target) {
    const minValue = parseInt(target.min)
    const maxValue = parseInt(target.max)
    const midValue = minValue + maxValue / 2

    return [minValue, midValue, maxValue]
  }

  addMinValue(minValue, target) {
    const minValueSpan = document.createElement("span")

    target.appendChild(minValueSpan)
    minValueSpan.textContent = minValue
  }

  addMidValue(midValue, target) {
    const midValueSpan = document.createElement("span")
    target.appendChild(midValueSpan)
    midValueSpan.textContent = midValue
  }

  addMaxValue(maxValue, target) {
    const maxValueSpan = document.createElement("span")
    target.appendChild(maxValueSpan)
    maxValueSpan.textContent = maxValue
  }


}
