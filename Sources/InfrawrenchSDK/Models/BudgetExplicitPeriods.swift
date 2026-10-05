/*
 * InfrawrenchSDK v1.58.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.58.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BudgetExplicitPeriods: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case explicit
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "explicit": self = .explicit
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .explicit: return "explicit"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .explicit,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public struct Period: Codable, Hashable, Sendable {
        public var start: String
        public var end: String
        /// This period's limit, for a spend budget.
        public var amountCents: Int?
        /// This period's limit, for a usage budget.
        public var usageAmount: Double?

        public init(
            start: String,
            end: String,
            amountCents: Int? = nil,
            usageAmount: Double? = nil
        ) {
            self.start = start
            self.end = end
            self.amountCents = amountCents
            self.usageAmount = usageAmount
        }
    }

    public var kind: Kind
    /// Non-overlapping, inclusive periods, each with its own amount.
    public var periods: [Period]

    public init(
        kind: Kind,
        periods: [Period]
    ) {
        self.kind = kind
        self.periods = periods
    }
}
