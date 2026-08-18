/*
 * InfrawrenchSDK v1.28.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.28.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PeerPane: Codable, Hashable, Sendable {
    public var tabLabel: String
    public var pluginLogoSvg: String
    public var peerPluginId: String
    public var schema: JsonObject

    public init(
        tabLabel: String,
        pluginLogoSvg: String,
        peerPluginId: String,
        schema: JsonObject
    ) {
        self.tabLabel = tabLabel
        self.pluginLogoSvg = pluginLogoSvg
        self.peerPluginId = peerPluginId
        self.schema = schema
    }
}
