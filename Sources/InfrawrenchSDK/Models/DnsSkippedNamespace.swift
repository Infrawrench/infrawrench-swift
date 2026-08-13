/*
 * InfrawrenchSDK v1.23.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.23.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DnsSkippedNamespace: Codable, Hashable, Sendable {
    public var pluginId: PluginId
    public var pluginName: String
    public var label: String
    public var reason: String

    public init(
        pluginId: PluginId,
        pluginName: String,
        label: String,
        reason: String
    ) {
        self.pluginId = pluginId
        self.pluginName = pluginName
        self.label = label
        self.reason = reason
    }
}
