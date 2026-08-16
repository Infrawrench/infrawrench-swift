/*
 * InfrawrenchSDK v1.27.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.27.0).
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
    public var createdByUserId: String?
    public var createdAt: String
    public var updatedAt: String
    public var coverage: BusinessMetricCoverage?

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
        createdByUserId: String? = nil,
        createdAt: String,
        updatedAt: String,
        coverage: BusinessMetricCoverage? = nil
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
        self.createdByUserId = createdByUserId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.coverage = coverage
    }
}
