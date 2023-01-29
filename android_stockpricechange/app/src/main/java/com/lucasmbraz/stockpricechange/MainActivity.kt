package com.lucasmbraz.stockpricechange

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material.Button
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Surface
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.tooling.preview.Preview
import com.lucasmbraz.stockpricechange.StockPriceApplication.Companion.ENGINE_ID
import com.lucasmbraz.stockpricechange.ui.theme.StockPriceChangeTheme
import io.flutter.embedding.android.FlutterActivity

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            StockPriceChangeTheme {
                // A surface container using the 'background' color from the theme
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colors.background
                ) {
                    LaunchFlutterButton()
                }
            }
        }
    }
}

@Composable
fun LaunchFlutterButton() {
    val mContext = LocalContext.current

    Column(
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally,
    ) {
        Button(onClick = {
            mContext.startActivity(
                FlutterActivity.withCachedEngine(ENGINE_ID).build(mContext)
            )
        }) {
            Text("Launch Flutter Activity")
        }
    }
}

@Preview(showBackground = true)
@Composable
fun DefaultPreview() {
    StockPriceChangeTheme {
        LaunchFlutterButton()
    }
}