/*
 * InfrawrenchSDK v1.82.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.82.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DashboardKpiResult: Codable, Hashable, Sendable {
    public enum Unit: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case money
        case moneyPerUnit
        case percent
        case count
        case quantity
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "money": self = .money
            case "money_per_unit": self = .moneyPerUnit
            case "percent": self = .percent
            case "count": self = .count
            case "quantity": self = .quantity
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .money: return "money"
            case .moneyPerUnit: return "money_per_unit"
            case .percent: return "percent"
            case .count: return "count"
            case .quantity: return "quantity"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Unit] = [
            .money,
            .moneyPerUnit,
            .percent,
            .count,
            .quantity,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var value: Double?
    public var unit: Unit
    public var currency: String?
    public var perUnit: String?
    public var previous: Double?
    public var change: Double?
    public var changePercent: Double?
    public var upIsGood: Bool
    public var from: String?
    public var to: String?
    public var previousFrom: String?
    public var previousTo: String?
    public var sourceName: String?
    public var limit: Double?
    public var note: String?

    public init(
        value: Double? = nil,
        unit: Unit,
        currency: String? = nil,
        perUnit: String? = nil,
        previous: Double? = nil,
        change: Double? = nil,
        changePercent: Double? = nil,
        upIsGood: Bool,
        from: String? = nil,
        to: String? = nil,
        previousFrom: String? = nil,
        previousTo: String? = nil,
        sourceName: String? = nil,
        limit: Double? = nil,
        note: String? = nil
    ) {
        self.value = value
        self.unit = unit
        self.currency = currency
        self.perUnit = perUnit
        self.previous = previous
        self.change = change
        self.changePercent = changePercent
        self.upIsGood = upIsGood
        self.from = from
        self.to = to
        self.previousFrom = previousFrom
        self.previousTo = previousTo
        self.sourceName = sourceName
        self.limit = limit
        self.note = note
    }
}
