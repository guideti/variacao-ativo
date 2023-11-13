import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, map } from 'rxjs';
import { AssetChart, Result } from '../../chart/models/chart.models';

@Injectable({
  providedIn: 'root',
})
export class HomeService {
  // public formattedAssetData!: FormattedAssetData;

  private readonly apiUrl = '/v8/finance/chart/';
  // https://query2.finance.yahoo.com/v8/finance/chart/?symbol=BTC-USD&range=1mo&interval=1d

  constructor(private readonly http: HttpClient) {}

  getAssetData(asset: string): Observable<Result[]> {
    const params = new HttpParams()
      .set('symbol', asset)
      .set('range', '1mo')
      .set('interval', '1d');
    return this.http
      .get<AssetChart>(this.apiUrl, { params })
      .pipe(map((search) => search.chart.result));
  }
}
