import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class ChartService {
  constructor(private readonly http: HttpClient) {}
  private readonly apiUrl =
    'https://query2.finance.yahoo.com/v8/finance/chart/BTC-USD';

  listActive(): Observable<any> {
    return this.http.get<any>(this.apiUrl);
  }
}
