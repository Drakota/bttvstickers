package com.drakota.bttvstickers

import android.content.ClipDescription
import android.content.Context
import android.inputmethodservice.InputMethodService
import android.net.Uri
import android.os.Build
import android.os.Vibrator
import android.view.View
import android.widget.GridView
import androidx.core.content.FileProvider
import androidx.core.view.inputmethod.InputConnectionCompat
import androidx.core.view.inputmethod.InputContentInfoCompat
import com.bumptech.glide.Glide
import org.json.JSONObject
import java.io.File


class StickerInputMethod : InputMethodService() {
    override fun onCreate() {
        super.onCreate()
    }

    private fun send(emote: JSONObject) {
        val future = Glide
                .with(applicationContext)
                .downloadOnly()
                .load(emote.getString("imageUrl"))
                .submit()

        Thread {
            val temp = future.get()
            val cacheFile = File(applicationContext.externalCacheDir, "cached_sticker")
            temp.copyTo(cacheFile, true)

            val contentUri = if (Build.VERSION.SDK_INT >= 24)
                FileProvider.getUriForFile(
                        applicationContext,
                        applicationContext.packageName + ".fileProvider",
                        cacheFile
                )
            else
                Uri.fromFile(cacheFile)

            commitImage(emote, contentUri)
        }.start()
    }

    private fun commitImage(emote: JSONObject, contentUri: Uri) {
        val mimeType = "image/" + emote.getString("imageType")
        val inputContentInfo = InputContentInfoCompat(
                contentUri,
                ClipDescription(emote.getString("code"), arrayOf(mimeType)),
                null
        )
        val inputConnection = currentInputConnection
        val editorInfo = currentInputEditorInfo
        var flags = 0
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N_MR1) {
            flags = flags or InputConnectionCompat.INPUT_CONTENT_GRANT_READ_URI_PERMISSION
        }
        InputConnectionCompat.commitContent(inputConnection, editorInfo, inputContentInfo, flags, null)
    }

    override fun onCreateInputView(): View? {
        val vibratorService = getSystemService(Context.VIBRATOR_SERVICE) as Vibrator
        val root: View = layoutInflater.inflate(R.layout.keyboard, null)
        val emoteList: GridView = root.findViewById(R.id.EmoteList)
        val directoryName = "/data/user/0/com.drakota.bttvstickers/app_flutter/pack.json"

        val pack = JSONObject(File(directoryName).readText(Charsets.UTF_8))
        val emotes = pack.getJSONArray("emotes")

        val customAdapter = PackAdapter(applicationContext, emotes)
        emoteList.adapter = customAdapter
        emoteList.setOnItemClickListener { _, _, position, _ ->
            val selectedEmote = emotes.get(position) as JSONObject
            send(selectedEmote)
            Utils.performHapticFeedback(applicationContext, 15)
        }

        return root
    }
}