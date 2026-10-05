/*
 * InfrawrenchSDK v1.55.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.55.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// One rule or setting that moved money, in pipeline order.
public struct PricingEffect: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case rerateList
        case rerateFallback
        case discounts
        case credits
        case commitmentBenefits
        case percentage
        case fixed
        case reallocation
        case tiered
        case expression
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "rerate_list": self = .rerateList
            case "rerate_fallback": self = .rerateFallback
            case "discounts": self = .discounts
            case "credits": self = .credits
            case "commitment_benefits": self = .commitmentBenefits
            case "percentage": self = .percentage
            case "fixed": self = .fixed
            case "reallocation": self = .reallocation
            case "tiered": self = .tiered
            case "expression": self = .expression
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .rerateList: return "rerate_list"
            case .rerateFallback: return "rerate_fallback"
            case .discounts: return "discounts"
            case .credits: return "credits"
            case .commitmentBenefits: return "commitment_benefits"
            case .percentage: return "percentage"
            case .fixed: return "fixed"
            case .reallocation: return "reallocation"
            case .tiered: return "tiered"
            case .expression: return "expression"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .rerateList,
            .rerateFallback,
            .discounts,
            .credits,
            .commitmentBenefits,
            .percentage,
            .fixed,
            .reallocation,
            .tiered,
            .expression,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// A billing rule id, or one of `rerate:list`, `rerate:fallback`,
    /// `treatment:discounts`, `treatment:credits`,
    /// `treatment:commitment_benefits`.
    public var key: String
    public var ruleId: String?
    public var label: String
    public var kind: Kind
    /// Currency → what it added or removed.
    public var totals: [String: Double]

    public init(
        key: String,
        ruleId: String? = nil,
        label: String,
        kind: Kind,
        totals: [String: Double]
    ) {
        self.key = key
        self.ruleId = ruleId
        self.label = label
        self.kind = kind
        self.totals = totals
    }
}
