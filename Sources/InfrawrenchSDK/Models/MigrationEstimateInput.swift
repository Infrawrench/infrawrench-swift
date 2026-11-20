/*
 * InfrawrenchSDK v1.123.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.123.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct MigrationEstimateInput: Codable, Hashable, Sendable {
    public var name: String
    public var source: MigrationEstimateSource
    /// The provider to price on, as a plugin id (`hetzner`, `gcp`).
    public var targetPluginId: String
    /// A region of the target provider, or null for the one nearest the source
    /// resources.
    public var targetRegion: String?
    /// Per source resource id, the user's target type and size in place of the
    /// match.
    public var overrides: [String: MigrationRowOverride]?

    public init(
        name: String,
        source: MigrationEstimateSource,
        targetPluginId: String,
        targetRegion: String? = nil,
        overrides: [String: MigrationRowOverride]? = nil
    ) {
        self.name = name
        self.source = source
        self.targetPluginId = targetPluginId
        self.targetRegion = targetRegion
        self.overrides = overrides
    }
}
