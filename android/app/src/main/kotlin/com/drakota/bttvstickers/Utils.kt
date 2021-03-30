package com.drakota.bttvstickers

import android.os.Build
import android.os.VibrationEffect
import android.os.Vibrator
import android.content.Context

class Utils {
    companion object {
        fun performHapticFeedback(context: Context, ms: Long) {
            val vibratorService = context.getSystemService(Context.VIBRATOR_SERVICE) as Vibrator
            vibratorService.let { vs ->
                if (Build.VERSION.SDK_INT >= 26) {
                    vs.vibrate(VibrationEffect.createOneShot(ms, VibrationEffect.DEFAULT_AMPLITUDE))
                } else {
                    @Suppress("DEPRECATION")
                    vs.vibrate(ms)
                }
            }
        }
    }
}