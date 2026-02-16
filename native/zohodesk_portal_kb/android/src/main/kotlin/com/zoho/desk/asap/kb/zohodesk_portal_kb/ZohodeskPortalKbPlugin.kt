package com.zoho.desk.asap.kb.zohodesk_portal_kb

import android.app.Activity
import androidx.annotation.NonNull
import com.zoho.desk.asap.apikit.zohodesk_portal_apikit.ZDPBaseActivityAwarePlugin
import com.zoho.desk.asap.kb.ZDPortalKB
import com.zoho.desk.asap.kb.utils.RelatedArticleScope
import com.zoho.desk.asap.kb.utils.ZDPKBConfiguration
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.Result

/** ZohodeskPortalKbPlugin */
class ZohodeskPortalKbPlugin : ZDPBaseActivityAwarePlugin("zohodesk_portal_kb") {
  companion object {
    private var isArticleDetailSearchAllowed = true
    private var disableArticleLike = false
    private var disableArticleDislike = false
    private var disableTextReader = true
    private var disableKeySearcher = true
    private var relatedArticleScope: RelatedArticleScope? = null
  }

  override fun showMethod(activity: Activity) {
    ZDPortalKB.show(activity)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when(call.method) {
      "showCategoryWithPermalink" -> showCategoryWithPermalink(call, result)
      "showArticleWithPermalink" -> showArticleWithPermalink(call, result)
      "disableArticleDetailSearch" -> disableArticleDetailSearch(call, result)
      "disableArticleLike" -> disableArticleLike(call, result)
      "disableArticleDislike" -> disableArticleDislike(call, result)
      "disableTextReader" -> disableTextReader(call, result)
      "disableKeySearcher" -> disableKeySearcher(call, result)
      "relatedArticlePreference" -> relatedArticlePreference(call, result)
      "searchPreference" -> searchPreference(call, result)
      else -> super.onMethodCall(call, result)
    }
  }

  private fun showCategoryWithPermalink(@NonNull call: MethodCall, @NonNull result: Result) {
    try {
      val paramsMap = call.arguments as? HashMap<*, *>
      val permaLink = paramsMap?.get("permalink") as? String
      ZDPortalKB.showCategoryWithPermalink(activity, permaLink)
    } catch (e:Exception) {
      result.success(false)
    }
  }

  private fun showArticleWithPermalink(@NonNull call: MethodCall, @NonNull result: Result) {
    try {
      val paramsMap = call.arguments as? HashMap<*, *>
      val permaLink = paramsMap?.get("permalink") as? String
      ZDPortalKB.showArticleWithPermalink(activity, permaLink)
    } catch (e:Exception) {
      result.success(false)
    }
  }

  private fun disableArticleDetailSearch(@NonNull call: MethodCall, @NonNull result: Result) {
    try {
      val isDisable = getIsDisable(call)
      isArticleDetailSearchAllowed = !isDisable
      applyKbConfiguration()
    } catch (e: Exception) {
      result.success(false)
    }
  }

  private fun disableArticleLike(@NonNull call: MethodCall, @NonNull result: Result) {
    try {
      disableArticleLike = getIsDisable(call)
      applyKbConfiguration()
    } catch (e: Exception) {
      result.success(false)
    }
  }

  private fun disableArticleDislike(@NonNull call: MethodCall, @NonNull result: Result) {
    try {
      disableArticleDislike = getIsDisable(call)
      applyKbConfiguration()
    } catch (e: Exception) {
      result.success(false)
    }
  }

  private fun disableTextReader(@NonNull call: MethodCall, @NonNull result: Result) {
    try {
      disableTextReader = getIsDisable(call)
      applyKbConfiguration()
    } catch (e: Exception) {
      result.success(false)
    }
  }

  private fun disableKeySearcher(@NonNull call: MethodCall, @NonNull result: Result) {
    try {
      disableKeySearcher = getIsDisable(call)
      applyKbConfiguration()
    } catch (e: Exception) {
      result.success(false)
    }
  }

  private fun relatedArticlePreference(@NonNull call: MethodCall, @NonNull result: Result) {
    try {
      val paramsMap = call.arguments as? HashMap<*, *>
      val preference = paramsMap?.get("preference") as? String
      relatedArticleScope = when(preference) {
        "hidden" -> RelatedArticleScope.HIDDEN
        "category" -> RelatedArticleScope.CATEGORY
        "section" -> RelatedArticleScope.SECTION
        else -> relatedArticleScope
      }
      applyKbConfiguration()
    } catch (e: Exception) {
      result.success(false)
    }
  }

  private fun searchPreference(@NonNull call: MethodCall, @NonNull result: Result) {
    try {
      val paramsMap = call.arguments as? HashMap<*, *>
      val preference = paramsMap?.get("preference") as? String
      when(preference) {
        "global" -> ZDPortalKB.setSearchScope(ZDPortalKB.SearchScope.GLOABAL)
        "category" -> ZDPortalKB.setSearchScope(ZDPortalKB.SearchScope.CATEGORY)
        "section" -> ZDPortalKB.setSearchScope(ZDPortalKB.SearchScope.SECTION)
      }
    } catch (e: Exception) {
      result.success(false)
    }
  }

  private fun getIsDisable(@NonNull call: MethodCall): Boolean {
    val paramsMap = call.arguments as? HashMap<*, *>
    return paramsMap?.get("isDisable") as? Boolean ?: false
  }

  private fun applyKbConfiguration() {
    val builder = ZDPKBConfiguration.Builder()
      .isArticleDetailSearchAllowed(isArticleDetailSearchAllowed)
      .disableArticleLike(disableArticleLike)
      .disableArticleDislike(disableArticleDislike)
      .disableTextReader(disableTextReader)
      .disableKeySearcher(disableKeySearcher)
    relatedArticleScope?.let { builder.relatedArticlePreference(it) }
    ZDPortalKB.setConfiguration(builder.build())
  }
}
