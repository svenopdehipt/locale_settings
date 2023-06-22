package com.opdehipt.locale_settings

import android.content.res.Configuration
import android.os.Build
import android.os.Bundle
import android.view.MenuInflater
import android.view.View
import android.view.ViewGroup
import androidx.appcompat.app.AppCompatDelegate
import io.flutter.embedding.android.FlutterActivity

open class LocaleActivity : FlutterActivity() {
    private lateinit var compatDelegate: AppCompatDelegate

    override fun onCreate(savedInstanceState: Bundle?) {
        compatDelegate = AppCompatDelegate.create(this, null)
        super.onCreate(savedInstanceState)
        compatDelegate.onCreate(savedInstanceState)
    }

    override fun onPostCreate(savedInstanceState: Bundle?) {
        super.onPostCreate(savedInstanceState)
        compatDelegate.onPostCreate(savedInstanceState)
    }

    override fun onConfigurationChanged(newConfig: Configuration) {
        super.onConfigurationChanged(newConfig)
        compatDelegate.onConfigurationChanged(newConfig)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            LocaleSettingsPlugin.channel?.invokeMethod("localeUpdated", mapOf("locale" to newConfig.locales[0].toLanguageTag()))
        }
    }

    override fun onStart() {
        super.onStart()
        compatDelegate.onStart()
    }

    override fun onStop() {
        super.onStop()
        compatDelegate.onStop()
    }

    override fun onPostResume() {
        super.onPostResume()
        compatDelegate.onPostResume()
    }

    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        compatDelegate.onSaveInstanceState(outState)
    }

    override fun setTitle(title: CharSequence?) {
        super.setTitle(title)
        compatDelegate.setTitle(title)
    }

    override fun onDestroy() {
        super.onDestroy()
        compatDelegate.onDestroy()
    }

    override fun addContentView(view: View?, params: ViewGroup.LayoutParams?) {
        compatDelegate.addContentView(view, params)
    }

    override fun setContentView(view: View?) {
        compatDelegate.setContentView(view)
    }

    override fun setContentView(layoutResID: Int) {
        compatDelegate.setContentView(layoutResID)
    }

    override fun setContentView(view: View?, params: ViewGroup.LayoutParams?) {
        compatDelegate.setContentView(view, params)
    }

    override fun invalidateOptionsMenu() {
        compatDelegate.invalidateOptionsMenu()
    }

    override fun getMenuInflater(): MenuInflater = compatDelegate.menuInflater

    override fun <T : View?> findViewById(id: Int) = compatDelegate.findViewById<T>(id)
}