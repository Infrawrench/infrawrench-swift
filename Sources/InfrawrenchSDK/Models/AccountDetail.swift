/*
 * InfrawrenchSDK v1.104.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.104.0).
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
        public var oauthStatus: AccountOAuthStatus?
        /// The apps this connection is for, as product ids (`infrastructure`,
        /// `costs`, `observability`, `incidents`, `security`, `delivery`,
        /// `automation`). `null` means every app the plugin offers. Collection
        /// follows it: an account connected for `costs` alone is not
        /// resource-synced, and one without `costs` has no cost data collected.
        public var products: [String]?

        public init(
            id: String,
            pluginId: String,
            displayName: String,
            oauthStatus: AccountOAuthStatus? = nil,
            products: [String]? = nil
        ) {
            self.id = id
            self.pluginId = pluginId
            self.displayName = displayName
            self.oauthStatus = oauthStatus
            self.products = products
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
