// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "zohodesk_portal_configuration",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(
            name: "zohodesk-portal-configuration",
            targets: ["zohodesk_portal_configuration"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/zoho/ZohoDeskPortalConfiguration", exact: "4.6.8"),
        .package(name: "zohodesk_portal_apikit", path: "../zohodesk_portal_apikit")
    ],
    targets: [
        .target(
            name: "zohodesk_portal_configuration",
            dependencies: [
                .product(name: "ZohoDeskPortalConfiguration", package: "ZohoDeskPortalConfiguration"),
                .product(name: "zohodesk-portal-apikit", package: "zohodesk_portal_apikit")
            ]
        )
    ]
)
