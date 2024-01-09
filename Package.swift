// swift-tools-version:5.9

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
        .iOS(.v17),
        .watchOS(.v10)
    ],
    products: [
        .library(name: "SpeziMockWebService", targets: ["SpeziMockWebService"])
    ],
    dependencies: [
        .package(url: "https://github.com/StanfordSpezi/Spezi", from: "1.0.0"),
        .package(url: "https://github.com/StanfordSpezi/SpeziViews", from: "1.0.0")
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
