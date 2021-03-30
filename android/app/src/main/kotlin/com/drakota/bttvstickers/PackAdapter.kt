package com.drakota.bttvstickers
import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.ImageView
import com.bumptech.glide.Glide
import org.json.JSONArray
import org.json.JSONObject


class PackAdapter(var context: Context, var emotes: JSONArray) : BaseAdapter() {
    private val inflator: LayoutInflater = LayoutInflater.from(context)

    override fun getCount(): Int {
        return emotes.length()
    }

    override fun getItem(position: Int): JSONObject {
        return emotes.get(position) as JSONObject
    }

    override fun getItemId(position: Int): Long {
        return position.toLong()
    }

    override fun getView(position: Int, convertView: View?, parent: ViewGroup): View {
        val emote = emotes.get(position) as JSONObject
        val view: View
        if (convertView == null) {
            view = inflator.inflate(R.layout.emote, parent, false)
        } else {
            view = convertView
        }
        val imageView = view.findViewById<ImageView>(R.id.EmoteImage)
        val url = emote.getString("imageUrl")
        Glide.with(context).load(url).into(imageView)
        return view
    }
}