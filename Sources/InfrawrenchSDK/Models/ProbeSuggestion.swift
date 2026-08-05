/*
 * InfrawrenchSDK v0.34.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.34.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ProbeSuggestion: Codable, Hashable, Sendable {
    /// Normalized to an absolute URL — bare hosts get https://.
    public var url: String
    public var resourceId: String
    public var displayName: String
    public var pluginId: PluginId
    public var resourceTypeId: String
    public var accountId: String
    /// The output/field key the URL was mined from.
    public var outputKey: String

    public init(
        url: String,
        resourceId: String,
        displayName: String,
        pluginId: PluginId,
        resourceTypeId: String,
        accountId: String,
        outputKey: String
    ) {
        self.url = url
        self.resourceId = resourceId
        self.displayName = displayName
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.accountId = accountId
        self.outputKey = outputKey
    }
}
