import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';

import { ChartComponent } from './chart/chart.component';
import { HomeComponent } from './home/home.component';
import { LayoutRoutingModule } from './layout-routing.module';

@NgModule({
  declarations: [HomeComponent],
  imports: [CommonModule, LayoutRoutingModule, ChartComponent],
})
export class LayoutModule {}
