package io.talkcaddy

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "io.talkcaddy/geolocator"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "stopGeolocatorService" -> {
                    stopGeolocatorForegroundService()
                    result.success(true)
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun stopGeolocatorForegroundService() {
        try {
            val serviceIntent = Intent(this, Class.forName("com.baseflow.geolocator.GeolocatorForegroundService"))
            stopService(serviceIntent)
        } catch (e: Exception) {
            // Service might not exist or already stopped
        }
    }
}
