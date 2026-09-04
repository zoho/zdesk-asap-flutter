// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "zohodesk_portal_submit_ticket",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(
            name: "zohodesk-portal-submit-ticket",
            targets: ["zohodesk_portal_submit_ticket"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/zoho/ZohoDeskPortalTicket", exact: "4.6.8"),
        .package(name: "zohodesk_portal_apikit", path: "../zohodesk_portal_apikit")
    ],
    targets: [
        .target(
            name: "zohodesk_portal_submit_ticket",
            dependencies: [
                .product(name: "ZohoDeskPortalTicket", package: "ZohoDeskPortalTicket"),
                .product(name: "zohodesk-portal-apikit", package: "zohodesk_portal_apikit")
            ]
        )
    ]
)
