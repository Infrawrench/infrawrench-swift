/*
 * InfrawrenchSDK v1.108.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.108.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CiResourceOutputs: Codable, Hashable, Sendable {
    public struct Output: Codable, Hashable, Sendable {
        public var key: String
        public var label: String
        public var sensitive: Bool

        public init(
            key: String,
            label: String,
            sensitive: Bool
        ) {
            self.key = key
            self.label = label
            self.sensitive = sensitive
        }
    }

    public struct SecretVersion2: Codable, Hashable, Sendable {
        public var id: String
        public var state: String
        public var createdAt: String?

        public init(
            id: String,
            state: String,
            createdAt: String? = nil
        ) {
            self.id = id
            self.state = state
            self.createdAt = createdAt
        }
    }

    public var outputs: [Output]
    public var secretVersions: [SecretVersion2]?

    public init(
        outputs: [Output],
        secretVersions: [SecretVersion2]? = nil
    ) {
        self.outputs = outputs
        self.secretVersions = secretVersions
    }
}
