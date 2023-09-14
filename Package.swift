// swift-tools-version:5.8

//
// This source file is part of the Stanford Spezi open source project
// 
// SPDX-FileCopyrightText: 2022 Stanford University and the project authors (see CONTRIBUTORS.md)
// 
// SPDX-License-Identifier: MIT
//

import PackageDescription


let package = Package(
    name: "SpeziMockWebService",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v16),
        .watchOS(.v9)
    ],
    products: [
        .library(name: "SpeziMockWebService", targets: ["SpeziMockWebService"])
    ],
    dependencies: [
        .package(url: "https://github.com/StanfordSpezi/Spezi", .upToNextMinor(from: "0.7.0")),
        .package(url: "https://github.com/StanfordSpezi/SpeziViews", .upToNextMinor(from: "0.5.0"))
    ],
    targets: [
        .target(
            name: "SpeziMockWebService",
            dependencies: [
                .product(name: "Spezi", package: "Spezi"),
                .product(name: "SpeziViews", package: "SpeziViews")
            ],
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "SpeziMockWebServiceTests",
            dependencies: [
                .target(name: "SpeziMockWebService")
            ]
        )
    ]
)
