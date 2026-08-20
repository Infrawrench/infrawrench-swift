/*
 * InfrawrenchSDK v1.33.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.33.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostScenarioModelInput: Codable, Hashable, Sendable {
    public var name: String
    public var description: String?
    /// Three-letter code. Every amount in the model must be in it — a model that
    /// mixed two would produce a projection that is the sum of two kinds of
    /// money, so this is refused rather than converted behind the caller's back.
    public var currency: String
    public var adjustments: [CostScenarioAdjustment]

    public init(
        name: String,
        description: String? = nil,
        currency: String,
        adjustments: [CostScenarioAdjustment]
    ) {
        self.name = name
        self.description = description
        self.currency = currency
        self.adjustments = adjustments
    }
}
