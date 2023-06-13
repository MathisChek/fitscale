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
          backgroundColor: ["#1edd88", "#FF5EFA", "#B2FFDE","#A7F578","#91EBEE", "#3B8DFE", "#A92831"],
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
            display: true,
            text: 'weekly point'
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
