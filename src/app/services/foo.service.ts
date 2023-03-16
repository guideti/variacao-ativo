import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { map, Observable } from 'rxjs';
@Injectable({
  providedIn: 'root'
})
export class FooService {

  constructor(private http: HttpClient) { }

  getPETR4Info(from: any, to: any): Observable<any> {

    return this.http.get("/petr4", {
      params: {
        'period1': from,
        'period2': to,
        'interval': '1d'
      }

    }).pipe(map((response: any) => {

      let _timestamp = response.chart.result[0].timestamp
      let _open = response.chart.result[0].indicators.quote[0].open
      let _close = response.chart.result[0].indicators.quote[0].close
      let _high = response.chart.result[0].indicators.quote[0].high
      let _low = response.chart.result[0].indicators.quote[0].low
      let _volume = response.chart.result[0].indicators.quote[0].volume

      let arr = [];
      // for (var i = 0; i < _timestamp.length; i++) {
      //   arr.push({
      //     o: _open[i],
      //     c: _close[i],
      //     h: _high[i],
      //     l: _low[i],
      //     x: _timestamp[i]
      //   })
      // }

      for (var i = 0; i < _timestamp.length; i++) {
        arr.push({
          x: new Date(_timestamp[i] * 1000),
          y: [parseFloat(_open[i]).toFixed(2), parseFloat(_high[i]).toFixed(2), parseFloat(_low[i]).toFixed(2), parseFloat(_close[i]).toFixed(2)]
        })
      }
      return arr
    }))
  }

}
