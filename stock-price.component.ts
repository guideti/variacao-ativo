import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Chart } from 'chart.js';

@Component({
  selector: 'app-stock-price',
  template: `
    <div *ngIf="stockPrice">
      <h2>Preço do Ativo: {{ stockPrice.regularMarketPrice }}</h2>
      <h3>Variação nos últimos 30 pregões: {{ stockPrice.regularMarketChange }}</h3>
      <div *ngIf="stockPrice.chart">
        <canvas id="stockChart"></canvas>
      </div>
    </div>
  `,
})
export class StockPriceComponent implements OnInit {
  stockPrice: any;

  constructor(private http: HttpClient) {}
 
  ngOnInit() {
    this.http
      .get('https://query1.finance.yahoo.com/v7/finance/chart/PETR4.SA?range=1d&interval=1d')
      .subscribe((data: any) => {
        this.stockPrice = data.chart.result[0].indicators.quote[0];
        
        const openPrices = data.chart.result[0].indicators.quote[0].open;
        const labels = data.chart.result[0].timestamp.slice(-30).map((time: number) =>
          new Date(time * 1000).toLocaleDateString()
        );

        const chartData = {
          labels,
          datasets: [
            {
              label: 'Preço de Abertura',
              data: openPrices.slice(-30),
              borderColor: '#3cba9f',
              fill: false,
            },
          ],
        };
        
        if(data && data.chart && data.chart.result && data.chart.result[0] && data.chart.result[0].indicators && data.chart.result[0].indicators.quote && data.chart.result[0].indicators.quote[0]){
          this.stockPrice = data.chart.result[0].indicators.quote[0];
          //...
        }else{
          console.log("Não foi possível carregar o preço do ativo");
        }

        const ctx = document.getElementById('stockChart');
        var ctx = number;
        console.log('teste');
        new Chart(ctx, {
          type: 'line',
          data: chartData,
          options: {
            legend: {
              display: false,
            },
          },
        });
      });
      
  }
}
