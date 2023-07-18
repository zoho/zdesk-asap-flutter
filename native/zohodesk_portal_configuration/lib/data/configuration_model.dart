///Theme
class ZDPTheme {

  static final ZDPTheme light = ZDPTheme._(0);
  static final ZDPTheme dark = ZDPTheme._(1);
  static final ZDPTheme system = ZDPTheme._(2);

  final int rawValue;

  ZDPTheme._(this.rawValue);
}