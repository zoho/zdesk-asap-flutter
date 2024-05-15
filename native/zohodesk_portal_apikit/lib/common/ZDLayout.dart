
class ZDLayout {

    ZDLayout({
        required this.id,
        required this.departmentId,
        this.layoutDesc,
        required this.layoutName,
        this.photoURL,
        required this.module,
        this.hasLogo = false,
        this.isDefaultLayout = false,
        this.isStandardLayout = true,
    });

    String id;
    String departmentId;
    String? layoutDesc;
    String layoutName;
    String? photoURL;
    String module;
    bool hasLogo;
    bool isDefaultLayout;
    bool isStandardLayout;

    ZDLayout.fromJson(Map<String, dynamic> json):
          id = json['id'],
          departmentId = json['departmentId'],
          layoutDesc = json['layoutDesc'],
          layoutName = json['layoutName'],
          photoURL = json['photoURL'],
          module = json['module'],
          hasLogo = json['hasLogo'],
          isDefaultLayout = json['isDefaultLayout'],
          isStandardLayout = json['isStandardLayout'];
}