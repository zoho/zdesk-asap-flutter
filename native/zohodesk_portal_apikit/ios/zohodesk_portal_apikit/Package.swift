// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "zohodesk_portal_apikit",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(
            name: "zohodesk-portal-apikit",
            targets: ["zohodesk_portal_apikit"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/zoho/ZohoDeskPortalAPIKit", exact: "4.6.8")
    ],
    targets: [
        .target(
            name: "zohodesk_portal_apikit",
            dependencies: [
                .product(name: "ZohoDeskPortalAPIKit", package: "ZohoDeskPortalAPIKit")
            ]
        )
    ]
)
