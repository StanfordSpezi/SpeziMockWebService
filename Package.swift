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
    platforms: [
        .iOS(.v16),
        .watchOS(.v9)
    ],
    products: [
        .library(name: "SpeziMockWebService", targets: ["SpeziMockWebService"])
    ],
    targets: [
        .target(
            name: "SpeziMockWebService"
        ),
        .testTarget(
            name: "SpeziMockWebServiceTests",
            dependencies: [
                .target(name: "SpeziMockWebService")
            ]
        )
    ]
)
