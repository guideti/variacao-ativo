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
import { FormattedAssetData } from '../../shared/models/chart.models';
import { HomeService } from './services/home.service';

@Component({
  standalone: true,
  imports: [
    InputTextModule,
    ButtonModule,
    TableModule,
    ReactiveFormsModule,
    CommonModule,
    ChartModule,
  ],
  selector: 'app-home',
  templateUrl: './home.component.html',
  styles: [
    `
      header {
        margin: 2rem;
      }
      .input-search-container,
      .noDataMessageExihibit {
        display: flex;
        justify-content: center;
      }
      input {
        margin-right: 1.5rem;
      }
      body {
        display: grid;
        grid-template-columns: 50% 50%;
        margin: 2rem;
      }
      .section {
        width: 50rem;
      }
    `,
  ],
})
export class HomeComponent implements OnInit, OnDestroy {
  assetForm!: FormGroup;
  private subs: Subscription[] = [];
  public formattedAssetData: FormattedAssetData[] = [];
  public formattedDateArray: string[] = [];
  public formattedCurrencyArray: number[] = [];
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
    this.formattedDateArray = [];
    this.formattedCurrencyArray = [];
    const formData = this.assetForm.get('asset')?.value;
    this.getBankAssetChart(formData);
  }

  getBankAssetChart(asset: string): void {
    this.subs.push(
      this.homeService.getAssetData(asset).subscribe({
        next: (response) => {
          const assetDatesArray = response.timestamp;
          const assetValuesArray = response.indicators.quote[0].open;
          const assetSymbol = response.meta.symbol;
          this.formatAssetDataAccordingToTable(
            assetDatesArray,
            assetValuesArray,
            assetSymbol
          );
        },
        error: () => {},
        complete: () => {},
      })
    );
  }

  formatAssetDataAccordingToTable(
    assetDatesArray: number[],
    assetValuesArray: number[],
    assetSymbol: string
  ): void {
    assetDatesArray.forEach((assetDate, index) => {
      const assetValueInTheFirstDay = assetValuesArray[0];
      const assetCurrentValue = assetValuesArray[index];

      this.formatAssetDateAccordingToChartAndPopulateCurrencyArray(
        assetDate,
        assetCurrentValue,
        assetSymbol
      );

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

  formatAssetDateAccordingToChartAndPopulateCurrencyArray(
    assetDate: number,
    assetCurrentValue: number,
    symbol: string
  ): void {
    const date = new Date(assetDate * 1000);
    const handleMonth = String(date.getUTCMonth()).padStart(2, '0');
    const handleDay = String(date.getUTCDay()).padStart(2, '0');
    const formattedDate =
      handleDay + '/' + handleMonth + '/' + date.getUTCFullYear();
    this.formattedDateArray.push(formattedDate);

    this.formattedCurrencyArray.push(assetCurrentValue);
    this.chartConfig(this.formattedDateArray, symbol);
  }

  chartConfig(assetDatesArray: string[], symbol: string): void {
    const documentStyle = getComputedStyle(document.documentElement);

    this.data = {
      labels: assetDatesArray,
      datasets: [
        {
          label: `Ativo: ${symbol}`,
          data: this.formattedCurrencyArray,
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
