// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "zohodesk_portal_chatkit",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(
            name: "zohodesk-portal-chatkit",
            targets: ["zohodesk_portal_chatkit"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/zoho/ZohoDeskPortalChatKit", exact: "4.6.8")
    ],
    targets: [
        .target(
            name: "zohodesk_portal_chatkit",
            dependencies: [
                .product(name: "ZohoDeskPortalChatKit", package: "ZohoDeskPortalChatKit")
            ]
        )
    ]
)
