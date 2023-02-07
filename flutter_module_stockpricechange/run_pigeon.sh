#!/bin/sh
flutter pub run pigeon --input pigeons/schema.dart \
  --dart_out lib/pigeon/api.dart \
  --objc_header_out ../ios_stockpricechange/stockpricechange/api.h \
  --objc_source_out ../ios_stockpricechange/stockpricechange/api.m \
  --objc_prefix SP \
  --java_out ../android_stockpricechange/app/src/main/java/com/lucasmbraz/stockpricechange/Api.java \
  --java_package "com.lucasmbraz.stockpricechange"
