/*
 * InfrawrenchSDK v1.29.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct OversizedResource: Codable, Hashable, Sendable {
    /// Infrawrench resource id.
    public var id: String
    public var pluginId: PluginId
    public var resourceTypeId: String
    public var resourceTypeName: String
    public var displayName: String
    /// Provider-native id, when known.
    public var externalId: String?
    /// Field to submit through the resource-update endpoint to apply the
    /// recommended size.
    public var sizeFieldKey: String
    /// Provider region/zone/location the resource lives in.
    public var region: String?
    public var currentSize: OversizedSizeSummary
    public var recommendedSize: OversizedSizeSummary
    /// p95 CPU utilisation over the window, percent of the current size.
    public var cpuP95: Double
    /// p95 memory utilisation, percent of the current size; null when unmeasured.
    public var memoryP95: Double?
    /// False when the provider stores no memory series for this resource.
    public var memoryMeasured: Bool
    /// Projected p95 CPU on the recommended size, for the confirm dialog.
    public var projectedCpuP95: Double
    /// ISO 4217 code the size prices are quoted in.
    public var currency: String
    /// Current minus recommended monthly price; null when either side is
    /// unpriced.
    public var monthlySaving: Double?
    /// Plugin-authored caveat (e.g. the provider requires the machine stopped).
    public var resizeNote: String?
    public var lastSyncedAt: String?

    public init(
        id: String,
        pluginId: PluginId,
        resourceTypeId: String,
        resourceTypeName: String,
        displayName: String,
        externalId: String? = nil,
        sizeFieldKey: String,
        region: String? = nil,
        currentSize: OversizedSizeSummary,
        recommendedSize: OversizedSizeSummary,
        cpuP95: Double,
        memoryP95: Double? = nil,
        memoryMeasured: Bool,
        projectedCpuP95: Double,
        currency: String,
        monthlySaving: Double? = nil,
        resizeNote: String? = nil,
        lastSyncedAt: String? = nil
    ) {
        self.id = id
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.resourceTypeName = resourceTypeName
        self.displayName = displayName
        self.externalId = externalId
        self.sizeFieldKey = sizeFieldKey
        self.region = region
        self.currentSize = currentSize
        self.recommendedSize = recommendedSize
        self.cpuP95 = cpuP95
        self.memoryP95 = memoryP95
        self.memoryMeasured = memoryMeasured
        self.projectedCpuP95 = projectedCpuP95
        self.currency = currency
        self.monthlySaving = monthlySaving
        self.resizeNote = resizeNote
        self.lastSyncedAt = lastSyncedAt
    }
}
