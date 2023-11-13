import { CommonModule } from '@angular/common';
import { Component, Input } from '@angular/core';
import { ChartModule } from 'primeng/chart';
@Component({
  selector: 'app-chart',
  standalone: true,
  imports: [CommonModule, ChartModule],
  template: ``,
  styles: [],
})
export class ChartComponent {
  @Input() assetChart: any;
  data: any;
  constructor() {
    this.chartConfig();
  }

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
