/*
 * InfrawrenchSDK v1.124.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.124.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct MigrationEstimate: Codable, Hashable, Sendable {
    public var id: String
    public var name: String
    public var source: MigrationEstimateSource
    public var sourceName: String?
    public var targetPluginId: String
    public var targetRegion: String?
    public var overrides: [String: MigrationRowOverride]
    public var createdByUserId: String?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        name: String,
        source: MigrationEstimateSource,
        sourceName: String? = nil,
        targetPluginId: String,
        targetRegion: String? = nil,
        overrides: [String: MigrationRowOverride],
        createdByUserId: String? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.name = name
        self.source = source
        self.sourceName = sourceName
        self.targetPluginId = targetPluginId
        self.targetRegion = targetRegion
        self.overrides = overrides
        self.createdByUserId = createdByUserId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
