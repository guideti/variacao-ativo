import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';

import { FooService } from '../services';
import * as moment from 'moment';
import * as ApexCharts from 'apexcharts';



@Component({
  selector: 'app-graph',
  templateUrl: './graph.component.html',
  styleUrls: ['./graph.component.sass']
})
export class GraphComponent implements OnInit {

  @ViewChild("chart", { static: true }) chartElement!: ElementRef;

  chart!: ApexCharts;


  constructor(private fooService: FooService) { }

  ngOnInit(): void {


    this.fooService.getPETR4Info(moment().subtract(30, 'days').unix(), moment().unix()).subscribe((response: any) => {

      this.chart = new ApexCharts(this.chartElement.nativeElement,
        {
          series: [{
            name: "candle",
            data: response
          }],
          chart: {
            type: "candlestick",
            height: 350
          },
          title: {
            text: "PETR4 Chart (últimos 30 dias)",
            align: "left"
          },
          xaxis: {
            type: "datetime"
          },
          yaxis: {
            tooltip: {
              enabled: true
            }
          }
        });

      this.chart.render()
    })
  }

}
