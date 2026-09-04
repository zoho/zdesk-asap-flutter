// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "zohodesk_portal_siq",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(
            name: "zohodesk-portal-siq",
            targets: ["zohodesk_portal_siq"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/zoho/ZohoDeskPortalSalesIQ", exact: "4.6.8")
    ],
    targets: [
        .target(
            name: "zohodesk_portal_siq",
            dependencies: [
                .product(name: "ZohoDeskPortalSalesIQ", package: "ZohoDeskPortalSalesIQ")
            ]
        )
    ]
)
