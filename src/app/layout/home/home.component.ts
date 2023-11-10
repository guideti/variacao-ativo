import { Component, OnDestroy, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { AssetChart } from '../chart/models/chart.models';
import { HomeService } from './services/home.service';

@Component({
  selector: 'app-home',
  template: `<app-chart [assetChart]="chartData"></app-chart>`,
  styles: [],
})
export class HomeComponent implements OnInit, OnDestroy {
  constructor(private readonly homeService: HomeService) {}
  private subs: Subscription[] = [];
  public chartData: any;
  ngOnInit(): void {
    this.getBankAssetChart();
  }

  convertTimeStampToDate(timeStamp?: string): any {
    const unix_timestamp = 1696896000;

    // Create a new JavaScript Date object based on the timestamp
    // multiplied by 1000 so that the argument is in milliseconds, not seconds
    const date = new Date(unix_timestamp * 1000);
    this.chartData = date;
    // // Hours part from the timestamp
    // var hours = date.getHours();
    // var day = date.getDate();
    // // Minutes part from the timestamp
    // var minutes = '0' + date.getMinutes();

    // // Seconds part from the timestamp
    // var seconds = '0' + date.getSeconds();

    // // Will display time in 10:30:23 format
    // var formattedTime =
    //   hours + ':' + minutes.substr(-2) + ':' + seconds.substr(-2);

    console.log(date);
  }

  getBankAssetChart(): void {
    this.subs.push(
      this.homeService.getAssetData().subscribe({
        next: (response: AssetChart) => {
          // this.convertTimeStampToDate(response.chart.result);
        },
        error: () => {},
        complete: () => {},
      })
    );
  }

  ngOnDestroy(): void {
    this.subs.map((item) => item.unsubscribe);
  }
}
