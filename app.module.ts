import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppComponent } from './app.component';
import { StockPriceComponent } from './stock-price/stock-price.component';
import { NgChartsModule } from 'ng2-charts';

import { HttpClientModule } from '@angular/common/http';
//import { HttpClientModule } from 'https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js';

@NgModule({
  declarations: [
    AppComponent,
    StockPriceComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    NgChartsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
