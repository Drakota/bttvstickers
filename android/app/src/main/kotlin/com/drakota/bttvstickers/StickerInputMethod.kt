package com.drakota.bttvstickers

import android.content.ClipDescription
import android.content.Intent
import android.content.res.Configuration
import android.inputmethodservice.InputMethodService
import android.net.Uri
import android.os.Build
import android.view.View
import android.view.inputmethod.EditorInfo
import android.widget.GridView
import androidx.core.content.FileProvider
import androidx.core.view.inputmethod.InputConnectionCompat
import androidx.core.view.inputmethod.InputContentInfoCompat
import com.bumptech.glide.Glide
import org.json.JSONArray
import org.json.JSONObject
import java.io.File


class StickerInputMethod : InputMethodService() {
    private val PACK_PATH_PATTERN = "%s/app_flutter/pack.json"
    private val CACHE_FILE_PATTERN = "cached_sticker.%s"

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
        } else {
            grantUriPermission(
                editorInfo.packageName,
                contentUri,
                Intent.FLAG_GRANT_READ_URI_PERMISSION
            )
        }
        InputConnectionCompat.commitContent(inputConnection, editorInfo, inputContentInfo, flags, null)
    }

    private fun commitContent(emote: JSONObject) {
        val future = Glide
                .with(applicationContext)
                .downloadOnly()
                .load(emote.getString("imageUrl"))
                .submit()

        Thread {
            val temp = future.get()
            val cacheFile = File(
                applicationContext.externalCacheDir,
                String.format(CACHE_FILE_PATTERN, emote.getString("imageType"))
            )
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

    override fun onStartInputView(info: EditorInfo?, restarting: Boolean) {
        setInputView(onCreateInputView())
    }

    override fun onCreateInputView(): View? {
        val root: View = layoutInflater.inflate(R.layout.keyboard, null)
        val emoteList: GridView = root.findViewById(R.id.EmoteList)
        emoteList.numColumns = if (resources.configuration.orientation == Configuration.ORIENTATION_PORTRAIT) 4 else 8
        val dataDir = applicationContext.packageManager.getPackageInfo(applicationContext.packageName, 0).applicationInfo.dataDir;
        val packFile = File(String.format(PACK_PATH_PATTERN, dataDir))

        val emotes = if (packFile.exists()) {
            val pack = JSONObject(packFile.readText(Charsets.UTF_8))
            if (pack.has("emotes")) pack.getJSONArray("emotes") else JSONArray()
        } else JSONArray()

        emoteList.adapter = PackAdapter(applicationContext, emotes, this::commitContent)
        return root
    }
}