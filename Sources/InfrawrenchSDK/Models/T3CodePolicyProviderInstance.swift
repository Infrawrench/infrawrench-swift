/*
 * InfrawrenchSDK v1.94.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.94.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct T3CodePolicyProviderInstance: Codable, Hashable, Sendable {
    public struct Environment: Codable, Hashable, Sendable {
        public var name: String
        public var value: String

        public init(
            name: String,
            value: String
        ) {
            self.name = name
            self.value = value
        }
    }

    public var locked: Bool
    public var environment: [Environment]?
    public var binaryPath: String?
    public var launchArgs: String?

    public init(
        locked: Bool,
        environment: [Environment]? = nil,
        binaryPath: String? = nil,
        launchArgs: String? = nil
    ) {
        self.locked = locked
        self.environment = environment
        self.binaryPath = binaryPath
        self.launchArgs = launchArgs
    }
}
