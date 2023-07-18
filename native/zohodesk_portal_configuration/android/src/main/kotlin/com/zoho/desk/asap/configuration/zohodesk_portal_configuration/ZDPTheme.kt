package com.zoho.desk.asap.configuration.zohodesk_portal_configuration
import android.graphics.Color
import androidx.annotation.ColorInt

/**
 * LightTheme Colors are Default for this Class
 * */

class ZDPTheme private constructor(
    @ColorInt colorPrimary: Int,
    @ColorInt colorPrimaryDark: Int,
    @ColorInt colorAccent: Int,
    @ColorInt windowBackground: Int,
    @ColorInt itemBackground: Int,
    @ColorInt textColorPrimary: Int,
    @ColorInt textColorSecondary: Int,
    @ColorInt colorOnPrimary: Int,
    @ColorInt iconTint: Int,
    @ColorInt divider: Int,
    @ColorInt listSelector: Int,
    @ColorInt hint: Int,
    @ColorInt formFieldBorder: Int,
    @ColorInt errorColor: Int,
    isDarkMode: Boolean
) {
    @ColorInt var colorPrimary: Int = colorPrimary
        private set
    @ColorInt var colorPrimaryDark: Int = colorPrimaryDark
        private set
    @ColorInt var colorAccent: Int = colorAccent
        private set
    @ColorInt var windowBackground: Int = windowBackground
        private set
    @ColorInt var itemBackground: Int = itemBackground
        private set
    @ColorInt var textColorPrimary: Int = textColorPrimary
        private set
    @ColorInt var textColorSecondary: Int = textColorSecondary
        private set
    @ColorInt var colorOnPrimary: Int = colorOnPrimary
        private set
    @ColorInt var iconTint: Int = iconTint
        private set
    @ColorInt var divider: Int = divider
        private set
    @ColorInt var listSelector: Int = listSelector
        private set
    @ColorInt var hint: Int = hint
        private set
    @ColorInt var formFieldBorder: Int = formFieldBorder
        private set
    @ColorInt var errorColor: Int = errorColor
        private set
    var isDarkMode: Boolean = isDarkMode
        private set

    data class Builder(private val isDarkMode: Boolean) {
        @ColorInt private var colorPrimary: Int =
            if (!isDarkMode) Color.parseColor("#1A7063") else Color.parseColor("#1A7063")
        @ColorInt private var colorPrimaryDark: Int =
            if (!isDarkMode) Color.parseColor("#0B6355") else Color.parseColor("#0B6355")
        @ColorInt private var colorAccent: Int =
            if (!isDarkMode) Color.parseColor("#1A7063") else Color.parseColor("#1A7063")
        @ColorInt private var windowBackground: Int =
            if (!isDarkMode) Color.parseColor("#F6F8FB") else Color.parseColor("#1b212b")
        @ColorInt private var itemBackground: Int =
            if (!isDarkMode) Color.parseColor("#FFFFFF") else Color.parseColor("#232B38")
        @ColorInt private var textColorPrimary: Int =
            if (!isDarkMode) Color.parseColor("#000000") else Color.parseColor("#E2E4E6")
        @ColorInt private var textColorSecondary: Int =
            if (!isDarkMode) Color.parseColor("#3F4C5E") else Color.parseColor("#A8B0BD")
        @ColorInt private var colorOnPrimary: Int =
            if (!isDarkMode) Color.parseColor("#FFFFFF") else Color.parseColor("#FFFFFF")
        @ColorInt private var iconTint: Int =
            if (!isDarkMode) Color.parseColor("#647196") else Color.parseColor("#A8B0BD")
        @ColorInt private var divider: Int =
            if (!isDarkMode) Color.parseColor("#EBEEF3") else Color.parseColor("#2D3748")
        @ColorInt private var listSelector: Int =
            if (!isDarkMode) Color.parseColor("#F1F7FE") else Color.parseColor("#2C3B4D")
        @ColorInt private var hint: Int =
            if (!isDarkMode) Color.parseColor("#69768C") else Color.parseColor("#8E949F")
        @ColorInt private var formFieldBorder: Int =
            if (!isDarkMode) Color.parseColor("#B8C4D1") else Color.parseColor("#465164")
        @ColorInt private var errorColor: Int =
            if (!isDarkMode) Color.parseColor("#DE3535") else Color.parseColor("#FF6B6B")

        fun setColorPrimary(@ColorInt colorPrimary: Int) = this.apply {
            this.colorPrimary = colorPrimary
        }

        fun setColorPrimaryDark(@ColorInt colorPrimaryDark: Int) = this.apply {
            this.colorPrimaryDark = colorPrimaryDark
        }

        fun setColorAccent(@ColorInt colorAccent: Int) = this.apply {
            this.colorAccent = colorAccent
        }

        fun setWindowBackground(@ColorInt windowBackground: Int) = this.apply {
            this.windowBackground = windowBackground
        }

        fun setItemBackground(@ColorInt itemBackground: Int) = this.apply {
            this.itemBackground = itemBackground
        }

        fun setTextColorPrimary(@ColorInt textColorPrimary: Int) = this.apply {
            this.textColorPrimary = textColorPrimary
        }

        fun setTextColorSecondary(@ColorInt textColorSecondary: Int) = this.apply {
            this.textColorSecondary = textColorSecondary
        }

        fun setColorOnPrimary(@ColorInt colorOnPrimary: Int) = this.apply {
            this.colorOnPrimary = colorOnPrimary
        }

        fun setIconTint(@ColorInt iconTint: Int) = this.apply {
            this.iconTint = iconTint
        }

        fun setDividerColor(@ColorInt divider: Int) = this.apply {
            this.divider = divider
        }

        fun setListSelectorColor(@ColorInt listSelector: Int) = this.apply {
            this.listSelector = listSelector
        }

        fun setHintColor(@ColorInt hint: Int) = this.apply {
            this.hint = hint
        }

        fun setFormFieldBorder(@ColorInt formFieldBorder: Int) = this.apply {
            this.formFieldBorder = formFieldBorder
        }

        fun setErrorColor(@ColorInt errorColor: Int) = this.apply {
            this.errorColor = errorColor
        }



        fun build() = ZDPTheme(
            colorPrimary = colorPrimary,
            colorPrimaryDark = colorPrimaryDark,
            colorAccent = colorAccent,
            windowBackground = windowBackground,
            itemBackground = itemBackground,
            textColorPrimary = textColorPrimary,
            textColorSecondary = textColorSecondary,
            colorOnPrimary = colorOnPrimary,
            iconTint = iconTint,
            divider = divider,
            listSelector = listSelector,
            hint = hint,
            isDarkMode = isDarkMode,
            formFieldBorder = formFieldBorder,
            errorColor = errorColor
        )
    }
}