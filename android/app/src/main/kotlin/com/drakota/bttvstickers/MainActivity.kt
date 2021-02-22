package com.drakota.bttvstickers

import android.content.Intent
import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.drakota.bttvstickers/sticker_indexing_service"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            if (call.method == "generatePack") {
                val intent = Intent(baseContext, StickerIndexingService::class.java)
                intent.putExtra("emotes", call.arguments as ArrayList<String>)
                startService(intent)
            }
        }
    }
}