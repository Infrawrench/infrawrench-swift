/*
 * InfrawrenchSDK v1.77.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.77.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BudgetHierarchyWarning: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case allocation
        case actual
        case forecast
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "allocation": self = .allocation
            case "actual": self = .actual
            case "forecast": self = .forecast
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .allocation: return "allocation"
            case .actual: return "actual"
            case .forecast: return "forecast"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .allocation,
            .actual,
            .forecast,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// `allocation`: the children's own amounts for this period (children on the
    /// same period only) add up to more than the parent's. `actual`: together
    /// they have already spent more. `forecast`: together they are projected to.
    public var kind: Kind
    /// The children's total, in the parent's unit.
    public var childTotal: Double
    /// The parent's limit for the period, in the same unit.
    public var parentLimit: Double

    public init(
        kind: Kind,
        childTotal: Double,
        parentLimit: Double
    ) {
        self.kind = kind
        self.childTotal = childTotal
        self.parentLimit = parentLimit
    }
}
