#!/bin/sh
flutter pub run pigeon --input pigeons/schema.dart \
  --dart_out lib/pigeon.dart \
  --java_out ../android_stockpricechange/app/src/main/java/com/lucasmbraz/stockpricechange/FlutterApi.java \
  --java_package "com.lucasmbraz.stockpricechange"
