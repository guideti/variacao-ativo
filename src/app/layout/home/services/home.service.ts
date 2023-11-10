import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { AssetChart } from '../../chart/models/chart.models';

@Injectable({
  providedIn: 'root',
})
export class HomeService {
  private readonly apiUrl = '/v8/finance/chart/BTC-USD';
  // https://query2.finance.yahoo.com/v8/finance/chart/?symbol=BTC-USD&range=1mo&interval=1d

  constructor(private readonly http: HttpClient) {}

  getAssetData(): Observable<any> {
    return this.http.get<AssetChart>(this.apiUrl);
  }
}
