/*
 * InfrawrenchSDK v1.99.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.99.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BusinessMetric: Codable, Hashable, Sendable {
    public var id: String
    public var key: String
    public var name: String
    public var unit: String
    public var description: String?
    public var kind: BusinessMetricKind
    public var currency: String?
    public var costScope: [BusinessMetricScopeTerm]
    public var savedFilterId: String?
    public var labelMappings: [BusinessMetricLabelMapping]
    public var thresholds: [UnitCostThreshold]
    public var createdByUserId: String?
    public var createdAt: String
    public var updatedAt: String
    /// Null when the metric has no values at all; not an error, but every
    /// unit-cost chart drawn from it is one continuous gap.
    public var coverage: BusinessMetricCoverage?
    /// The scheduled importer feeding this metric, or null when its values are
    /// only pushed.
    public var importer: BusinessMetricImporterSummary?

    public init(
        id: String,
        key: String,
        name: String,
        unit: String,
        description: String? = nil,
        kind: BusinessMetricKind,
        currency: String? = nil,
        costScope: [BusinessMetricScopeTerm],
        savedFilterId: String? = nil,
        labelMappings: [BusinessMetricLabelMapping],
        thresholds: [UnitCostThreshold],
        createdByUserId: String? = nil,
        createdAt: String,
        updatedAt: String,
        coverage: BusinessMetricCoverage? = nil,
        importer: BusinessMetricImporterSummary? = nil
    ) {
        self.id = id
        self.key = key
        self.name = name
        self.unit = unit
        self.description = description
        self.kind = kind
        self.currency = currency
        self.costScope = costScope
        self.savedFilterId = savedFilterId
        self.labelMappings = labelMappings
        self.thresholds = thresholds
        self.createdByUserId = createdByUserId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.coverage = coverage
        self.importer = importer
    }
}
