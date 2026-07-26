/*
 * InfrawrenchSDK v0.4.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.4.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ValidateTabsRequest: Codable, Hashable, Sendable {
    public struct Tab: Codable, Hashable, Sendable {
        public var id: String
        public var target: TabTarget

        public init(
            id: String,
            target: TabTarget
        ) {
            self.id = id
            self.target = target
        }
    }

    public var tabs: [Tab]

    public init(
        tabs: [Tab]
    ) {
        self.tabs = tabs
    }
}
