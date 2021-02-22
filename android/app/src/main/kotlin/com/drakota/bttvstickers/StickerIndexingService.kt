package com.drakota.bttvstickers

import android.app.IntentService
import android.content.Intent
import android.net.Uri
import android.util.Log
import com.google.firebase.appindexing.FirebaseAppIndex
import com.google.firebase.appindexing.FirebaseAppIndexingInvalidArgumentException
import com.google.firebase.appindexing.Indexable
import com.google.firebase.appindexing.builders.Indexables
import com.google.firebase.appindexing.builders.StickerBuilder
import java.io.IOException

class StickerIndexingService() : IntentService("StickerIndexingService") {
    private val TAG = "StickerIndexingService"
    private val STICKER_PACK_NAME = "BTTV Stickers"
    private val STICKER_PACK_URL = "bttvstickers://emote/pack/bttvstickers"
    private val STICKER_PACK_IMAGE = "android.resource://com.drakota.bttvstickers/" + R.mipmap.ic_launcher
    private val STICKER_IMAGE_URL_PATTERN = "https://cdn.betterttv.net/emote/%s/3x"
    private val STICKER_URL_PATTERN = "bttvstickers://emote/%s"

    override fun onHandleIntent(intent: Intent?) {
        try {
            clearStickerPack()
            val emotes = intent?.getStringArrayListExtra("emotes")!!
            if (emotes.isEmpty()) {
                // If we are clearing the pack, just clear it and return
                return
            }
            val stickers = getIndexableStickers(emotes)
            val stickerPack = getIndexableStickerPack(emotes)
            val indexables = ArrayList(stickers)
            indexables.add(stickerPack)

            val task = FirebaseAppIndex
                    .getInstance(applicationContext)
                    .update(*indexables.toTypedArray())

            task.addOnFailureListener { e ->
                Log.d(TAG, "Failed to install stickers", e)
            }
        } catch (e: IOException) {
            Log.e(TAG, "Unable to set stickers", e)
        } catch (e: FirebaseAppIndexingInvalidArgumentException) {
            Log.e(TAG, "Unable to set stickers", e)
        }
    }

    private fun getIndexableStickers(emotes: ArrayList<String>): List<Indexable> {
        val stickerBuilders = getStickerBuilders(emotes)
        return stickerBuilders.map { it.build() }
    }

    private fun getStickerBuilders(emotes: ArrayList<String>): List<StickerBuilder> {
        val stickerBuilders = arrayListOf<StickerBuilder>()

        for ((index, value) in emotes.withIndex()) {
            val stickerBuilder = Indexables.stickerBuilder()
                    .setName("$index")
                    .setUrl(String.format(STICKER_URL_PATTERN, value))
                    .setImage(String.format(STICKER_IMAGE_URL_PATTERN, value))
                    .setIsPartOf(Indexables.stickerPackBuilder()
                            .setName(STICKER_PACK_NAME)
                            .setUrl(STICKER_PACK_URL))
            stickerBuilders.add(stickerBuilder)
        }

        return stickerBuilders
    }

    private fun getIndexableStickerPack(emotes: ArrayList<String>): Indexable {
        val packImageUri = Uri.parse(STICKER_PACK_IMAGE).toString()
        val stickerBuilders = getStickerBuilders(emotes)
        return Indexables.stickerPackBuilder()
                .setName(STICKER_PACK_NAME)
                .setUrl(STICKER_PACK_URL)
                .setImage(packImageUri)
                .setHasSticker(*stickerBuilders.toTypedArray())
                .build()
    }

    private fun clearStickerPack() {
        val task = FirebaseAppIndex
                .getInstance(applicationContext)
                .removeAll()

        task.addOnFailureListener { e ->
            Log.d(TAG, "Failed to clear stickers", e)
        }
    }
}