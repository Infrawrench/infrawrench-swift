/*
 * InfrawrenchSDK v1.34.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.34.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// What an adjusted answer did. Present whenever the request asked to be
/// adjusted, even for an organisation with no rules — its absence means, and can
/// only mean, that every figure in the response is exactly what the providers
/// charged.
public struct CostAdjustmentSummary: Codable, Hashable, Sendable {
    public struct Rule: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case percentage
            case fixed
            case reallocation
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "percentage": self = .percentage
                case "fixed": self = .fixed
                case "reallocation": self = .reallocation
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .percentage: return "percentage"
                case .fixed: return "fixed"
                case .reallocation: return "reallocation"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .percentage,
                .fixed,
                .reallocation,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var id: String
        public var name: String
        public var kind: Kind
        public var summary: String

        public init(
            id: String,
            name: String,
            kind: Kind,
            summary: String
        ) {
            self.id = id
            self.name = name
            self.kind = kind
            self.summary = summary
        }
    }

    /// The enabled rules in force for this answer, in evaluation order.
    public var rules: [Rule]
    /// The collected, unadjusted totals for exactly the same rows, summed in the
    /// same scan. Always present on an adjusted answer — this is the figure that
    /// reconciles against an invoice. Per-series raw figures are deliberately not
    /// offered: after a reallocation the series are a different partition of the
    /// same money.
    public var rawTotals: [String: Double]
    /// Fixed-amount charges over the period, pro-rated. On a cost query these are
    /// reported here and **not** folded into `totals`, which stays the sum of the
    /// series; the figure an organisation reports internally is the adjusted
    /// total plus this. On a showback report they are additionally booked onto
    /// the cost centre the rule names.
    public var fixedTotals: [String: Double]

    public init(
        rules: [Rule],
        rawTotals: [String: Double],
        fixedTotals: [String: Double]
    ) {
        self.rules = rules
        self.rawTotals = rawTotals
        self.fixedTotals = fixedTotals
    }
}
