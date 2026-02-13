///Related Article Preference
class ZDPRelatedArticlePreference {

  static final ZDPRelatedArticlePreference hidden = ZDPRelatedArticlePreference._("hidden");
  static final ZDPRelatedArticlePreference category = ZDPRelatedArticlePreference._("category");
  static final ZDPRelatedArticlePreference section = ZDPRelatedArticlePreference._("section");

  final String rawValue;

  ZDPRelatedArticlePreference._(this.rawValue);
}

///Search Preference
class ZDPSearchPreference {

  static final ZDPSearchPreference global = ZDPSearchPreference._("global");
  static final ZDPSearchPreference category = ZDPSearchPreference._("category");
  static final ZDPSearchPreference section = ZDPSearchPreference._("section");

  final String rawValue;

  ZDPSearchPreference._(this.rawValue);
}