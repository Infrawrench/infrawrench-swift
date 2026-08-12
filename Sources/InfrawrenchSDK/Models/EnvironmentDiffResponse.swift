/*
 * InfrawrenchSDK v1.22.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.22.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct EnvironmentDiffResponse: Codable, Hashable, Sendable {
    public var a: EnvironmentDiffSideSummary
    public var b: EnvironmentDiffSideSummary
    public var pluginId: PluginId
    public var pluginName: String
    /// Every resource type present on either side, most-divergent first.
    public var types: [EnvironmentDiffTypeSummary]
    /// Only the slots that differ; identical pairs are counted, not listed.
    public var entries: [EnvironmentDiffEntry]
    public var totals: EnvironmentDiffTotals
    /// Resource types excluded because they could not be listed. Always empty
    /// over this API — it reads already-synced rows, which cannot half-fail — and
    /// populated only by the desktop and CLI local modes, which list live.
    public var unavailableTypes: [EnvironmentDiffUnavailableType]
    public var includeIdentityFields: Bool
    public var generatedAt: String

    public init(
        a: EnvironmentDiffSideSummary,
        b: EnvironmentDiffSideSummary,
        pluginId: PluginId,
        pluginName: String,
        types: [EnvironmentDiffTypeSummary],
        entries: [EnvironmentDiffEntry],
        totals: EnvironmentDiffTotals,
        unavailableTypes: [EnvironmentDiffUnavailableType],
        includeIdentityFields: Bool,
        generatedAt: String
    ) {
        self.a = a
        self.b = b
        self.pluginId = pluginId
        self.pluginName = pluginName
        self.types = types
        self.entries = entries
        self.totals = totals
        self.unavailableTypes = unavailableTypes
        self.includeIdentityFields = includeIdentityFields
        self.generatedAt = generatedAt
    }
}
