/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AgentLinkScopeGroup: Codable, Hashable, Sendable {
    public struct Scope: Codable, Hashable, Sendable {
        public var value: String
        public var label: String

        public init(
            value: String,
            label: String
        ) {
            self.value = value
            self.label = label
        }
    }

    public var title: String
    public var scopes: [Scope]

    public init(
        title: String,
        scopes: [Scope]
    ) {
        self.title = title
        self.scopes = scopes
    }
}
