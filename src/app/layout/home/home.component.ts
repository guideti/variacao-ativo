import { CommonModule } from '@angular/common';
import { Component, OnDestroy, OnInit } from '@angular/core';
import {
  FormBuilder,
  FormControl,
  FormGroup,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';
import { ButtonModule } from 'primeng/button';
import { ChartModule } from 'primeng/chart';
import { InputTextModule } from 'primeng/inputtext';
import { TableModule } from 'primeng/table';
import { Subscription } from 'rxjs';
import { ChartComponent } from '../chart/chart.component';
import { FormattedAssetData } from '../chart/models/chart.models';
import { HomeService } from './services/home.service';

@Component({
  standalone: true,
  imports: [
    InputTextModule,
    ButtonModule,
    TableModule,
    ReactiveFormsModule,
    ChartComponent,
    CommonModule,
    ChartModule,
  ],
  selector: 'app-home',
  templateUrl: './home.component.html',
  styles: [],
})
export class HomeComponent implements OnInit, OnDestroy {
  assetForm!: FormGroup;
  private subs: Subscription[] = [];
  public chartData: any;
  public formattedAssetData: FormattedAssetData[] = [];
  public valuePreviousDay!: number;
  data: any;
  constructor(
    private readonly fb: FormBuilder,
    private readonly homeService: HomeService
  ) {}
  ngOnInit(): void {
    this.creatForm();
  }

  creatForm(): void {
    this.assetForm = this.fb.group({
      asset: new FormControl(null, Validators.required),
    });
  }
  submit(): void {
    this.formattedAssetData = [];
    const formData = this.assetForm.get('asset')?.value;
    this.getBankAssetChart(formData);
  }

  getBankAssetChart(asset: string): void {
    this.subs.push(
      this.homeService.getAssetData(asset).subscribe({
        next: (response) => {
          this.chartData = response;
          const assetDatesArray = response[0].timestamp;
          const assetValuesArray = response[0].indicators.quote[0].open;
          this.chartConfig(assetDatesArray, assetValuesArray);
          this.formatAssetDataAccordingToTable(
            assetDatesArray,
            assetValuesArray
          );
        },
        error: () => {},
        complete: () => {},
      })
    );
  }
  formatAssetDataAccordingToTable(
    assetDatesArray: number[],
    assetValuesArray: number[]
  ) {
    assetDatesArray.forEach((assetDate, index) => {
      // Hours part from the timestamp
      var date = new Date(assetDate * 1000);
      var hours = date.getHours();
      const assetValueInTheFirstDay = assetValuesArray[0];
      const assetCurrentValue = assetValuesArray[index];

      const tableObject = {
        day: index + 1,
        date: assetDate,
        value: assetCurrentValue,
        variationPreviousDay: assetCurrentValue - this.valuePreviousDay,
        variationComparedToFirstDay:
          assetCurrentValue - assetValueInTheFirstDay,
      };
      this.valuePreviousDay = tableObject.value;
      this.formattedAssetData.push(tableObject);
    });
  }

  chartConfig(assetDatesArray: number[], assetValuesArray: number[]) {
    const documentStyle = getComputedStyle(document.documentElement);
    const textColor = documentStyle.getPropertyValue('--text-color');
    const textColorSecondary = documentStyle.getPropertyValue(
      '--text-color-secondary'
    );
    const surfaceBorder = documentStyle.getPropertyValue('--surface-border');

    this.data = {
      labels: assetDatesArray,
      datasets: [
        {
          label: 'First Dataset',
          data: assetValuesArray,
          fill: false,
          borderColor: documentStyle.getPropertyValue('--blue-500'),
          tension: 0.4,
        },
      ],
    };
  }

  ngOnDestroy(): void {
    this.subs.map((item) => item.unsubscribe);
  }
}
