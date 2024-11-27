// package com.example.flutter_study2

// import io.flutter.embedding.android.FlutterActivity
// import io.flutter.embedding.engine.FlutterEngine
// import io.flutter.plugin.common.MethodChannel
// import androidx.annotation.NonNull

// class MainActivity: FlutterActivity() {
//     private val CHANNEL = "com.example.app/channel"

//     override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
//         super.configureFlutterEngine(flutterEngine)
        
//         MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
//             when (call.method) {
//                 "getNativeMessage" -> {
//                     result.success("안녕하세요! 네이티브 코드로부터의 메시지입니다.")
//                 }
//                 else -> {
//                     result.notImplemented()
//                 }
//             }
//         }
//     }
// }
