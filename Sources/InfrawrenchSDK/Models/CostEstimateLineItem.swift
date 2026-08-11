/*
 * InfrawrenchSDK v1.13.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.13.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostEstimateLineItem: Codable, Hashable, Sendable {
    public var label: String
    public var monthlyAmount: Double
    public var detail: String?
    public var quantity: Double?
    public var unit: String?

    public init(
        label: String,
        monthlyAmount: Double,
        detail: String? = nil,
        quantity: Double? = nil,
        unit: String? = nil
    ) {
        self.label = label
        self.monthlyAmount = monthlyAmount
        self.detail = detail
        self.quantity = quantity
        self.unit = unit
    }
}
