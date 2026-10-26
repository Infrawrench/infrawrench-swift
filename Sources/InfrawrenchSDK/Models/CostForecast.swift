/*
 * InfrawrenchSDK v1.84.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.84.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostForecast: Codable, Hashable, Sendable {
    public var id: String
    public var reportId: String
    public var name: String
    public var description: String?
    public var scenarioModelIds: [String]
    public var driverMetricId: String?
    public var isDefault: Bool
    public var createdByUserId: String?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        reportId: String,
        name: String,
        description: String? = nil,
        scenarioModelIds: [String],
        driverMetricId: String? = nil,
        isDefault: Bool,
        createdByUserId: String? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.reportId = reportId
        self.name = name
        self.description = description
        self.scenarioModelIds = scenarioModelIds
        self.driverMetricId = driverMetricId
        self.isDefault = isDefault
        self.createdByUserId = createdByUserId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
