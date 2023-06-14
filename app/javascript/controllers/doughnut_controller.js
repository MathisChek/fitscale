import { Controller } from "@hotwired/stimulus"
import Chart from 'chart.js/auto';

// Connects to data-controller="doughnut"
export default class extends Controller {
  static targets = ["card"]

  connect() {

    // DATA TO DISPLAY
    const data = [
      Number(this.cardTarget.dataset.avg_end),
      Number(this.cardTarget.dataset.avg_str),
      Number(this.cardTarget.dataset.avg_dex)
    ];

    const labels = ["Breath Difficulty", "Muscular Effort", "Flexibility"]

    // CONFIGUE THE CHART
    const cfg = {
      type: 'doughnut',
      data: {
        labels: labels,
        datasets: [{
          data: data,
          backgroundColor: ["#73BBC9", "#FD1015", "#1ED584"],
          hoverOffset: 30
        }]
      },
      options: {
        plugins: {
          legend: { display: false },
          tooltip: { enabled: true }
        },
        title: {
          display: false
        },
        layout: {
          padding: 20
      }
      }
    };

    // CREATE THE CHART
    new Chart(this.cardTarget, cfg);
  }
}
