/*
 * InfrawrenchSDK v1.17.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.17.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostScenarioModel: Codable, Hashable, Sendable {
    public var id: String
    public var name: String
    public var description: String?
    /// The one currency every amount in this model is denominated in.
    public var currency: String
    public var adjustments: [CostScenarioAdjustment]
    public var createdByUserId: String?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        name: String,
        description: String? = nil,
        currency: String,
        adjustments: [CostScenarioAdjustment],
        createdByUserId: String? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.currency = currency
        self.adjustments = adjustments
        self.createdByUserId = createdByUserId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
