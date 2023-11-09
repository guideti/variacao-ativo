import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class HomeService {
  private readonly apiUrl = '/v8/finance/chart/BTC-USD';

  constructor(private readonly http: HttpClient) {}

  getAssetData(): Observable<any> {
    return this.http.get<any>(this.apiUrl);
  }
}
