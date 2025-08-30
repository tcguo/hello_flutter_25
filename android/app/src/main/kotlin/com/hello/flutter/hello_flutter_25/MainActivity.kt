package com.hello.flutter.hello_flutter_25

import io.flutter.embedding.android.FlutterActivity

import android.os.Bundle
import io.flutter.embedding.engine.FlutterShellArgs

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        intent.putExtra(FlutterShellArgs.ARG_KEY_DISABLE_SERVICE_AUTH_CODES, true)
        intent.putExtra(FlutterShellArgs.ARG_KEY_OBSERVATORY_PORT, 9999)
        super.onCreate(savedInstanceState)
    }
}
