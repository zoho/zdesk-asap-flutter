class ZDDepartment {

    ZDDepartment({
        this.photoURL,
        required this.name,
        this.description,
        required this.id,
        required this.nameInCustomerPortal,
        required this.layoutCount
    });

    String? photoURL;
    String name;
    String? description;
    String id;
    String nameInCustomerPortal;
    String layoutCount;

    ZDDepartment.fromJson(Map<String, dynamic> json):
        photoURL = json['photoURL'],
        name = json['name'],
        description = json['description'],
        id = json['id'],
        nameInCustomerPortal = json['nameInCustomerPortal'],
        layoutCount = json['layoutCount'];

}