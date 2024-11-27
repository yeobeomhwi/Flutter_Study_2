// package com.example.flutter_study2

// import io.flutter.embedding.android.FlutterActivity
// import io.flutter.embedding.engine.FlutterEngine
// import io.flutter.plugin.common.EventChannel
// import io.flutter.plugin.common.MethodChannel
// import kotlin.random.Random
// import android.os.Handler
// import android.os.Looper

// class MainActivity: FlutterActivity() {
//     companion object {
//         private const val EVENT_CHANNEL = "samples.flutter.dev/random"
//         private const val METHOD_CHANNEL = "samples.flutter.dev/random_control"
//     }

//     private val handler = Handler(Looper.getMainLooper())
//     private var isGenerating = false
//     private var runnable: Runnable? = null
//     private var eventSink: EventChannel.EventSink? = null

//     @Override
//     override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
//         super.configureFlutterEngine(flutterEngine)
        
//         // 이벤트 채널 설정
//         EventChannel(flutterEngine.dartExecutor.binaryMessenger, EVENT_CHANNEL).setStreamHandler(
//             object : EventChannel.StreamHandler {
//                 @Override
//                 override fun onListen(arguments: Any?, events: EventChannel.EventSink) {
//                     eventSink = events
//                 }

//                 @Override
//                 override fun onCancel(arguments: Any?) {
//                     eventSink = null
//                 }
//             }
//         )

//         // 메소드 채널 설정
//         MethodChannel(flutterEngine.dartExecutor.binaryMessenger, METHOD_CHANNEL).setMethodCallHandler { call, result ->
//             when (call.method) {
//                 "startRandom" -> {
//                     startGenerating()
//                     result.success(true)
//                 }
//                 "stopRandom" -> {
//                     stopGenerating()
//                     result.success(true)
//                 }
//                 else -> result.notImplemented()
//             }
//         }
//     }

//     private fun startGenerating() {
//         if (isGenerating) return
//         isGenerating = true
        
//         runnable = object : Runnable {
//             override fun run() {
//                 if (isGenerating) {
//                     val randomNumber = Random.nextInt(1, 101)
//                     eventSink?.success(randomNumber)
//                     handler.postDelayed(this, 1000)
//                 }
//             }
//         }
//         runnable?.let { handler.post(it) }
//     }

//     private fun stopGenerating() {
//         isGenerating = false
//         runnable?.let { handler.removeCallbacks(it) }
//     }

//     @Override
//     override fun onDestroy() {
//         stopGenerating()
//         super.onDestroy()
//     }
// }