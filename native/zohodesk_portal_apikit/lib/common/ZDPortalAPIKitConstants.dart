
/// Zoho Desk portal Data Centers
class ZDPDataCenter {

  static final ZDPDataCenter US = ZDPDataCenter._("US");
  static final ZDPDataCenter CN = ZDPDataCenter._("CN");
  static final ZDPDataCenter IN = ZDPDataCenter._("IN");
  static final ZDPDataCenter EU = ZDPDataCenter._("EU");
  static final ZDPDataCenter AU = ZDPDataCenter._("AU");
  static final ZDPDataCenter JP = ZDPDataCenter._("JP");
  static final ZDPDataCenter CA = ZDPDataCenter._("CA");
  static final ZDPDataCenter SA = ZDPDataCenter._("SA");
  static final ZDPDataCenter SG = ZDPDataCenter._("SG");
  static final ZDPDataCenter INEC = ZDPDataCenter._("INEC");
  static final ZDPDataCenter UAE = ZDPDataCenter._("UAE");

  final String rawValue;

  ZDPDataCenter._(this.rawValue);
}