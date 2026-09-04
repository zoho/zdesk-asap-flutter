// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "zohodesk_portal_kb",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(
            name: "zohodesk-portal-kb",
            targets: ["zohodesk_portal_kb"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/zoho/ZohoDeskPortalKB", exact: "4.6.8")
    ],
    targets: [
        .target(
            name: "zohodesk_portal_kb",
            dependencies: [
                .product(name: "ZohoDeskPortalKB", package: "ZohoDeskPortalKB")
            ]
        )
    ]
)
