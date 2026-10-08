/*
 * InfrawrenchSDK v1.79.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.79.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BudgetRecurringPeriod: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case recurring
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "recurring": self = .recurring
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .recurring: return "recurring"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .recurring,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Unit: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case day
        case week
        case month
        case quarter
        case year
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "day": self = .day
            case "week": self = .week
            case "month": self = .month
            case "quarter": self = .quarter
            case "year": self = .year
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .day: return "day"
            case .week: return "week"
            case .month: return "month"
            case .quarter: return "quarter"
            case .year: return "year"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Unit] = [
            .day,
            .week,
            .month,
            .quarter,
            .year,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var kind: Kind
    public var unit: Unit
    public var interval: Int
    /// First day of the first period (UTC, inclusive).
    public var startDate: String

    public init(
        kind: Kind,
        unit: Unit,
        interval: Int,
        startDate: String
    ) {
        self.kind = kind
        self.unit = unit
        self.interval = interval
        self.startDate = startDate
    }
}
