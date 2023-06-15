import { Controller } from "@hotwired/stimulus"
import Chart from 'chart.js/auto';


// Connects to data-controller="multi-bar-chart-dashboard"
export default class extends Controller {
  static targets = ["card"]
  static values = {
    days: Array,
    count: Array,
    la: Array
  }

  connect() {

    // DATA TO DISPLAY
    const data = this.countValue;
    const data2 = this.laValue;

    console.log(data)

    const labels = this.daysValue;
    console.log(labels)
    // CONFIGUE THE CHART
    const cfg = {
      data: {
        labels: labels,
        datasets: [
          {
          type: 'bar',
          data: data,
          backgroundColor: ["#ff8c4f", "#ffd65d", "#fe7998","#e60026","#028674", "#03b47b", "#02a89e"],
          borderWidth: 1,
        },
        {
          type: 'line',
          data: data2,
          borderColor: ["#1EDD88"],
          borderWidth: 1,
      }],
      },
      options: {
        plugins: {
          legend: { display: false },
          tooltip: { enabled: true },

          title: {
            display: false,
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
