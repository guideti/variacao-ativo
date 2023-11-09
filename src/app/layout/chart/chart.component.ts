import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { ChartService } from './chart.service';

@Component({
  selector: 'app-chart',
  standalone: true,
  imports: [CommonModule],
  template: '<p>chart works!</p>',
  styles: [],
})
export class ChartComponent {
  constructor(readonly chartService: ChartService) {}
}
