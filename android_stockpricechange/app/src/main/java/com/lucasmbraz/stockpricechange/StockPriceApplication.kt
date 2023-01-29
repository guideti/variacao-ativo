package com.lucasmbraz.stockpricechange

import android.app.Application
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor

class StockPriceApplication : Application() {
    companion object {
        const val ENGINE_ID = "stock_price_engine"
    }

    private lateinit var flutterEngine: FlutterEngine

    override fun onCreate() {
        super.onCreate()

        // Instantiate a FlutterEngine.
        flutterEngine = FlutterEngine(this)

        // Start executing Dart code to pre-warm the FlutterEngine.
        flutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )

        // Cache the FlutterEngine
        FlutterEngineCache.getInstance().put(ENGINE_ID, flutterEngine)
    }
}