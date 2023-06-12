import { Controller } from "@hotwired/stimulus"
import Chart from 'chart.js/auto';


// Connects to data-controller="bar-charts"
export default class extends Controller {
  static targets = ["card"]

  connect() {

    // DATA TO DISPLAY
    const data = [
      Number(this.cardTarget.dataset.end),
      Number(this.cardTarget.dataset.str),
      Number(this.cardTarget.dataset.dex)
    ];

    const labels = ["Breath Difficulty", "Muscular Effort", "Flexibility"]

    // CONFIGUE THE CHART
    const cfg = {
      type: 'bar',
      data: {
        labels: labels,
        datasets: [{
          data: data,
          backgroundColor: ["#73BBC9", "#FD1015", "#1ED584"],
          borderWidth: 1,
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
        scales: {
          color: "#FD1015",
          y: {
            grid: {
              display:false
            },
            max: 10,
            min: 0,
            ticks: {
              stepSize: 5
            }
          },
          x: {
            grid: {
              display:false
            },
            title: { display:false },
            display:false

          }
        }
      }
    }

    // CREATE THE CHART
    new Chart(this.cardTarget, cfg);
  }
}
