package com.lucasmbraz.stockpricechange

import android.content.Context
import android.content.res.Configuration
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.*
import androidx.compose.material.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalConfiguration
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.lucasmbraz.stockpricechange.FlutterApi.VisualisationType
import com.lucasmbraz.stockpricechange.StockPriceApplication.Companion.ENGINE_ID
import com.lucasmbraz.stockpricechange.ui.theme.StockPriceChangeTheme
import io.flutter.embedding.android.FlutterActivity

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            StockPriceChangeTheme {
                MainContent()
            }
        }
    }
}

@Composable
fun MainContent() {
    val mContext = LocalContext.current
    Scaffold(
        topBar = {
            TopAppBar(title = {
                Text(text = stringResource(id = R.string.app_name))
            })
        },
        content = { padding ->
            val configuration = LocalConfiguration.current
            when (configuration.orientation) {
                Configuration.ORIENTATION_PORTRAIT -> {
                    Column(
                        modifier = Modifier
                            .padding(padding)
                            .fillMaxSize(),
                        verticalArrangement = Arrangement.Center,
                        horizontalAlignment = Alignment.CenterHorizontally,
                    ) {
                        AppButton(
                            title = stringResource(R.string.table),
                            onClick = {
                                launchFlutter(mContext, VisualisationType.TABLE)
                            })
                        Spacer(modifier = Modifier.padding(32.dp))
                        AppButton(
                            title = stringResource(R.string.chart),
                            onClick = {
                                launchFlutter(mContext, VisualisationType.CHART)
                            },
                        )
                    }
                }
                else -> {
                    Row(
                        modifier = Modifier
                            .padding(padding)
                            .fillMaxSize(),
                        horizontalArrangement = Arrangement.Center,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        AppButton(
                            title = stringResource(R.string.table),
                            onClick = {
                                launchFlutter(mContext, VisualisationType.TABLE)
                            })
                        Spacer(modifier = Modifier.padding(32.dp))
                        AppButton(
                            title = stringResource(R.string.chart),
                            onClick = {
                                launchFlutter(mContext, VisualisationType.CHART)
                            },
                        )
                    }
                }
            }

        }
    )
}

fun launchFlutter(mContext: Context, visualisationType: VisualisationType) {
    mContext.startActivity(
        FlutterStockPriceActivity.withVisualisationType(
            mContext,
            visualisationType
        )
    )
}

@Composable
fun AppButton(title: String, onClick: () -> Unit) {
    OutlinedButton(modifier = Modifier.size(150.dp), onClick = onClick) {
        Text(title)
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
        MainContent()
    }
}