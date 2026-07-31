// swift-tools-version: 6.1
/*
 * InfrawrenchSDK v0.26.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.26.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */

import PackageDescription

let package = Package(
    name: "InfrawrenchSDK",
    // The floor is the async URLSession API this client is built on.
    platforms: [.macOS(.v12), .iOS(.v15), .tvOS(.v15), .watchOS(.v8)],
    products: [
        .library(name: "InfrawrenchSDK", targets: ["InfrawrenchSDK"]),
        .executable(name: "infrawrench-sdk-smoke", targets: ["InfrawrenchSDKSmokeTests"]),
    ],
    targets: [
        // No dependencies, by design: Foundation is the whole of it, so this
        // package resolves and builds with no network access at all.
        .target(name: "InfrawrenchSDK"),
        // The smoke suite is an executable rather than a `.testTarget`:
        // XCTest is absent from a Command Line Tools-only macOS toolchain,
        // and swift-testing would be a package dependency. This runs
        // wherever the package builds — `swift run infrawrench-sdk-smoke`.
        .executableTarget(name: "InfrawrenchSDKSmokeTests", dependencies: ["InfrawrenchSDK"]),
    ]
)
