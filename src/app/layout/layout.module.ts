import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';

import { HomeComponent } from './home/home.component';
import { LayoutRoutingModule } from './layout-routing.module';

@NgModule({
  declarations: [HomeComponent],
  imports: [CommonModule, LayoutRoutingModule],
})
export class LayoutModule {}
