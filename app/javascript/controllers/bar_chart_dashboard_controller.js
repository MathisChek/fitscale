import { Controller } from "@hotwired/stimulus"
import Chart from 'chart.js/auto';

// Connects to data-controller="bar-chart-dashboard"
export default class extends Controller {
  static targets = ["card"]
  static values = {
    keys: Array,
    values: Array
  }

  connect() {
    Chart.defaults.font.size = 20;
    Chart.defaults.color = "#ffffff";
    Chart.defaults.backgroundColor = '#ffffff';

    // DATA TO DISPLAY
    const data = this.valuesValue;

    const labels = this.keysValue;
    // CONFIGUE THE CHART
    const cfg = {
      type: 'bar',
      data: {
        labels: labels,
        datasets: [{
          data: data,
          backgroundColor: ["#ff8c4f", "#ffd65d", "#fe7998","#e60026","#028674", "#03b47b", "#02a89e", "#3e83fe", "#52b8e1", "#a3004c" ],
          borderWidth: 1,
        }]
      },
      options: {
        plugins: {
          legend: {
            display: false,
            labels: {
              // This more specific font property overrides the global property
              font: {
                  size: 24
              }
            }
          },
          tooltip: { enabled: true },

          title: {
            display: true,
            text: 'Muscles trained throught yours workouts'
          },
        },
        scales: {
          color: "#FD1015",
          y: {
            grid: {
              display:false
            },
            min: 0,
            ticks: {
              stepSize: 1
            }
          },
          x: {
            grid: {
              display:false
            },
            title: { display: true },
            display:true

          }
        }
      }
    }

    // CREATE THE CHART
    new Chart(this.cardTarget, cfg);
  }
}
