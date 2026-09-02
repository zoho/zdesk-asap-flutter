// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "zohodesk_portal_submit_ticket",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(name: "zohodesk-portal-submit-ticket", targets: ["zohodesk_portal_submit_ticket"])
    ],
    dependencies: [
        .package(url: "https://github.com/zoho/ZohoDeskPortalTicket.git", exact: "4.6.8"),
        .package(url: "https://github.com/zoho/ZohoDeskPortalAPIKit.git", exact: "4.6.8"),
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "zohodesk_portal_submit_ticket",
            dependencies: [
                .product(name: "ZohoDeskPortalTicket", package: "ZohoDeskPortalTicket"),
                .product(name: "ZohoDeskPortalAPIKit", package: "ZohoDeskPortalAPIKit"),
                .product(name: "FlutterFramework", package: "FlutterFramework")
            ]
        )
    ]
)
