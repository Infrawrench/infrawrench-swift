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

public struct CostScenarioResult: Codable, Hashable, Sendable {
    public struct Contribution: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case oneOff
            case recurring
            case rateChange
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "one_off": self = .oneOff
                case "recurring": self = .recurring
                case "rate_change": self = .rateChange
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .oneOff: return "one_off"
                case .recurring: return "recurring"
                case .rateChange: return "rate_change"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .oneOff,
                .recurring,
                .rateChange,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var adjustmentId: String
        public var label: String
        public var kind: Kind
        public var amount: Double

        public init(
            adjustmentId: String,
            label: String,
            kind: Kind,
            amount: Double
        ) {
            self.adjustmentId = adjustmentId
            self.label = label
            self.kind = kind
            self.amount = amount
        }
    }

    public var modelId: String
    public var modelName: String
    public var currency: String
    /// The adjusted projection — exactly the same days as `forecast`, never one
    /// more or fewer. A scenario modifies the projected region; it does not
    /// extend it, and it can never touch a day that already has recorded spend
    /// behind it.
    public var points: [CostSeriesPoint]
    /// Signed total each adjustment added across the horizon, in model order.
    public var contributions: [Contribution]
    /// Signed difference from the baseline across the horizon.
    public var totalDelta: Double
    /// Set when the model's amounts were converted at the org's stated rates.
    public var convertedFrom: String?
    /// Adjustments this chart's own filters exclude, by label — a GCP commitment
    /// on an AWS-filtered chart is correctly left out, and saying so is what
    /// makes the number trustworthy rather than quietly assumed broken.
    public var outOfScope: [String]

    public init(
        modelId: String,
        modelName: String,
        currency: String,
        points: [CostSeriesPoint],
        contributions: [Contribution],
        totalDelta: Double,
        convertedFrom: String? = nil,
        outOfScope: [String]
    ) {
        self.modelId = modelId
        self.modelName = modelName
        self.currency = currency
        self.points = points
        self.contributions = contributions
        self.totalDelta = totalDelta
        self.convertedFrom = convertedFrom
        self.outOfScope = outOfScope
    }
}
