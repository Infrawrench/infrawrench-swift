/*
 * InfrawrenchSDK v0.1.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.1.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SecretExportTemplate: Codable, Hashable, Sendable {
    public struct Entry: Codable, Hashable, Sendable {
        public var outputKey: String
        public var envKey: String

        public init(
            outputKey: String,
            envKey: String
        ) {
            self.outputKey = outputKey
            self.envKey = envKey
        }
    }

    public var id: String
    public var label: String
    public var description: String?
    public var entries: [Entry]

    public init(
        id: String,
        label: String,
        description: String? = nil,
        entries: [Entry]
    ) {
        self.id = id
        self.label = label
        self.description = description
        self.entries = entries
    }
}
