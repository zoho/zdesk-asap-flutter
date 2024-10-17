
/// Zoho Desk portal Data Centers
class ZDPDataCenter {

  static final ZDPDataCenter US = ZDPDataCenter._(0);
  static final ZDPDataCenter CN = ZDPDataCenter._(1);
  static final ZDPDataCenter IN = ZDPDataCenter._(2);
  static final ZDPDataCenter EU = ZDPDataCenter._(3);
  static final ZDPDataCenter AU = ZDPDataCenter._(4);
  static final ZDPDataCenter JP = ZDPDataCenter._(5);
  static final ZDPDataCenter CA = ZDPDataCenter._(6);
  static final ZDPDataCenter SA = ZDPDataCenter._(7);

  final int rawValue;

  ZDPDataCenter._(this.rawValue);
}