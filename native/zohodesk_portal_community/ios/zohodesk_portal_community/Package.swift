// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "zohodesk_portal_community",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(
            name: "zohodesk-portal-community",
            targets: ["zohodesk_portal_community"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/zoho/ZohoDeskPortalCommunity", exact: "4.6.8")
    ],
    targets: [
        .target(
            name: "zohodesk_portal_community",
            dependencies: [
                .product(name: "ZohoDeskPortalCommunity", package: "ZohoDeskPortalCommunity")
            ]
        )
    ]
)
