import { Controller } from "@hotwired/stimulus"
import Chart from 'chart.js/auto';


// Connects to data-controller="pie-charts"
export default class extends Controller {
  static targets = ["card"]

  connect() {
    console.log("hellooodosdos")

    const labels = ["Breath Difficulty", "Muscular Effort", "Flexibility"]

    const data = [
      Number(this.cardTarget.dataset.end),
      Number(this.cardTarget.dataset.str),
      Number(this.cardTarget.dataset.dex)
    ];

    const config = {
      type: 'polarArea',
      data: {
        labels: labels,
        datasets: [{
          data: data,
          backgroundColor: ["#73BBC9", "#FD1015", "#1ED584"],
          borderWidth: 1,
          hoverOffset: 20
        }]
      },
      options: {
        plugins: {
          legend: {
            position: 'bottom',
            align: 'start'

          }
        },
        title: {
          display: true,
          text: 'Predicted world population (millions) in 2050'
        },
        scales: {
          r: {
            ticks: {
              stepSize: 10
            },
            grid: {
               color: '#FFFFFF' }
          }
        }
      }
    };










    new Chart(this.cardTarget, config);


  }
}
