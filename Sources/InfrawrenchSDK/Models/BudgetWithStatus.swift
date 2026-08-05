/*
 * InfrawrenchSDK v0.35.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.35.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BudgetWithStatus: Codable, Hashable, Sendable {
    public struct CurrentMonthEvent: Codable, Hashable, Sendable {
        public enum ThresholdType: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case actual
            case forecast
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "actual": self = .actual
                case "forecast": self = .forecast
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .actual: return "actual"
                case .forecast: return "forecast"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [ThresholdType] = [
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

        public var id: String
        public var thresholdType: ThresholdType
        public var thresholdPercent: Int
        public var triggeredAt: String

        public init(
            id: String,
            thresholdType: ThresholdType,
            thresholdPercent: Int,
            triggeredAt: String
        ) {
            self.id = id
            self.thresholdType = thresholdType
            self.thresholdPercent = thresholdPercent
            self.triggeredAt = triggeredAt
        }
    }

    public struct Placement: Codable, Hashable, Sendable {
        public var widgetId: String
        public var dashboardId: String
        public var dashboardName: String

        public init(
            widgetId: String,
            dashboardId: String,
            dashboardName: String
        ) {
            self.widgetId = widgetId
            self.dashboardId = dashboardId
            self.dashboardName = dashboardName
        }
    }

    public var id: String
    public var name: String
    public var amountCents: Int
    public var currency: String
    public var filters: [BudgetCostFilter]
    public var thresholds: [BudgetThreshold]
    public var month: String
    public var actualCents: Int
    public var forecastCents: Int?
    public var currentMonthEvents: [CurrentMonthEvent]
    public var placements: [Placement]

    public init(
        id: String,
        name: String,
        amountCents: Int,
        currency: String,
        filters: [BudgetCostFilter],
        thresholds: [BudgetThreshold],
        month: String,
        actualCents: Int,
        forecastCents: Int? = nil,
        currentMonthEvents: [CurrentMonthEvent],
        placements: [Placement]
    ) {
        self.id = id
        self.name = name
        self.amountCents = amountCents
        self.currency = currency
        self.filters = filters
        self.thresholds = thresholds
        self.month = month
        self.actualCents = actualCents
        self.forecastCents = forecastCents
        self.currentMonthEvents = currentMonthEvents
        self.placements = placements
    }
}
