/*
 * InfrawrenchSDK v1.19.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.19.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AccountDetail: Codable, Hashable, Sendable {
    public struct Account2: Codable, Hashable, Sendable {
        public var id: String
        public var pluginId: String
        public var displayName: String

        public init(
            id: String,
            pluginId: String,
            displayName: String
        ) {
            self.id = id
            self.pluginId = pluginId
            self.displayName = displayName
        }
    }

    public var account: Account2
    public var resourceTypes: [ResourceTypeSummary]
    public var pluginDisplayName: String
    public var pluginLogoSvg: String

    public init(
        account: Account2,
        resourceTypes: [ResourceTypeSummary],
        pluginDisplayName: String,
        pluginLogoSvg: String
    ) {
        self.account = account
        self.resourceTypes = resourceTypes
        self.pluginDisplayName = pluginDisplayName
        self.pluginLogoSvg = pluginLogoSvg
    }
}
