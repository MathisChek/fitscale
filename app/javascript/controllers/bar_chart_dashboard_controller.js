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

    // DATA TO DISPLAY
    const data = this.valuesValue;

    console.log(data)

    const labels = this.keysValue;
    console.log(labels)
    // CONFIGUE THE CHART
    const cfg = {
      type: 'bar',
      data: {
        labels: labels,
        datasets: [{
          data: data,
          backgroundColor: ["#1edd88", "#FF5EFA", "#B2FFDE","#A7F578","#91EBEE", "#3B8DFE", "#A92831", "#ABA0F9", "#1B9476", "#82F2A7" ],
          borderWidth: 1,
        }]
      },
      options: {
        plugins: {
          legend: { display: false },
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
