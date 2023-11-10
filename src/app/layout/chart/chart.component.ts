import { CommonModule } from '@angular/common';
import { Component, Input } from '@angular/core';
import { ChartModule } from 'primeng/chart';
@Component({
  selector: 'app-chart',
  standalone: true,
  imports: [CommonModule, ChartModule],
  template: ` <div class="card">
    <p-chart type="line" [data]="data"></p-chart>
    <!-- [options]="options" -->
  </div>`,
  styles: [],
})
export class ChartComponent {
  @Input() assetChart: any;
  data: any;
  constructor() {
    this.chartConfig();

    alert(this.assetChart);
    // this.convertTimeStampToDate();
  }

  // convertTimeStampToDate(timeStamp?: string): any {
  //   let unix_timestamp = 1698537600;

  //   // Create a new JavaScript Date object based on the timestamp
  //   // multiplied by 1000 so that the argument is in milliseconds, not seconds
  //   var date = new Date(unix_timestamp * 1000);

  //   // Hours part from the timestamp
  //   var hours = date.getHours();

  //   // Minutes part from the timestamp
  //   var minutes = '0' + date.getMinutes();

  //   // Seconds part from the timestamp
  //   var seconds = '0' + date.getSeconds();

  //   // Will display time in 10:30:23 format
  //   var formattedTime =
  //     hours + ':' + minutes.substr(-2) + ':' + seconds.substr(-2);

  //   console.log(formattedTime);
  // }
  chartConfig() {
    const documentStyle = getComputedStyle(document.documentElement);
    const textColor = documentStyle.getPropertyValue('--text-color');
    const textColorSecondary = documentStyle.getPropertyValue(
      '--text-color-secondary'
    );
    const surfaceBorder = documentStyle.getPropertyValue('--surface-border');

    this.data = {
      labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
      datasets: [
        {
          label: 'First Dataset',
          data: [65, 59, 80, 81, 56, 55, 40],
          fill: false,
          borderColor: documentStyle.getPropertyValue('--blue-500'),
          tension: 0.4,
        },
        {
          label: 'Second Dataset',
          data: [28, 48, 40, 19, 86, 27, 90],
          fill: false,
          borderColor: documentStyle.getPropertyValue('--pink-500'),
          tension: 0.4,
        },
      ],
    };
  }
}
