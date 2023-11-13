export interface FormattedAssetData {
  day?: number;
  date: string | number;
  value: any | number;
  variationPreviousDay?: string | number;
  variationComparedToFirstDay?: string | number;
}

export interface AssetChart {
  chart: Chart;
}

export interface Chart {
  result: Result[];
  error: any;
}

export interface Result {
  meta: Meta;
  timestamp: number[];
  indicators: Indicators;
}

export interface Meta {
  currency: string;
  symbol: string;
  exchangeName: string;
  instrumentType: string;
  firstTradeDate: number;
  regularMarketTime: number;
  gmtoffset: number;
  timezone: string;
  exchangeTimezoneName: string;
  regularMarketPrice: number;
  chartPreviousClose: number;
  previousClose: number;
  scale: number;
  priceHint: number;
  currentTradingPeriod: CurrentTradingPeriod;
  tradingPeriods: TradingPeriod[];
  dataGranularity: string;
  range: string;
  validRanges: string[];
}

export interface CurrentTradingPeriod {
  pre: Pre;
  regular: Regular;
  post: Post;
}

export interface Pre {
  timezone: string;
  start: number;
  end: number;
  gmtoffset: number;
}

export interface Regular {
  timezone: string;
  start: number;
  end: number;
  gmtoffset: number;
}

export interface Post {
  timezone: string;
  start: number;
  end: number;
  gmtoffset: number;
}

export interface TradingPeriod {
  timezone: string;
  start: number;
  end: number;
  gmtoffset: number;
}

export interface Indicators {
  quote: Quote[];
}

export interface Quote {
  volume: number | undefined[];
  low: number | undefined[];
  high: number | undefined[];
  open: number[];
  close: number | undefined[];
}
