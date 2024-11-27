// package com.example.flutter_study2


// import io.flutter.embedding.android.FlutterActivity
// import io.flutter.embedding.engine.FlutterEngine
// import io.flutter.plugin.common.EventChannel
// import java.text.SimpleDateFormat
// import java.util.*
// import kotlin.concurrent.timer

// class MainActivity: FlutterActivity() {
//     companion object {
//         private const val STREAM = "samples.flutter.dev/time"
//     }

//     private var timeTimer: Timer? = null

//     @Override
//     override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
//         super.configureFlutterEngine(flutterEngine)
        
//         EventChannel(flutterEngine.dartExecutor.binaryMessenger, STREAM).setStreamHandler(
//             object : EventChannel.StreamHandler {
//                 @Override
//                 override fun onListen(arguments: Any?, events: EventChannel.EventSink) {
//                     timeTimer = timer(period = 1000) {
//                         val sdf = SimpleDateFormat("HH:mm:ss", Locale.getDefault())
//                         val currentTime = sdf.format(Date())
//                         activity.runOnUiThread {
//                             events.success(currentTime)
//                         }
//                     }
//                 }

//                 @Override
//                 override fun onCancel(arguments: Any?) {
//                     timeTimer?.cancel()
//                     timeTimer = null
//                 }
//             }
//         )
//     }

//     @Override
//     override fun onDestroy() {
//         timeTimer?.cancel()
//         super.onDestroy()
//     }
// }