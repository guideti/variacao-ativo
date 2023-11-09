import { Component, OnDestroy, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { HomeService } from './services/home.service';

@Component({
  selector: 'app-home',
  template: `<app-chart></app-chart>`,
  styles: [],
})
export class HomeComponent implements OnInit, OnDestroy {
  constructor(private readonly homeService: HomeService) {}
  private subs: Subscription[] = [];

  ngOnInit(): void {
    this.getBankAssetChart();
  }

  getBankAssetChart(): void {
    this.subs.push(
      this.homeService.getAssetData().subscribe({
        next: () => {},
        error: () => {},
        complete: () => {},
      })
    );
  }

  ngOnDestroy(): void {
    this.subs.map((item) => item.unsubscribe);
  }
}
