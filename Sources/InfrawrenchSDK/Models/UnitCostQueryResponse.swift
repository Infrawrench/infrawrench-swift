/*
 * InfrawrenchSDK v1.26.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.26.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct UnitCostQueryResponse: Codable, Hashable, Sendable {
    public struct Metric: Codable, Hashable, Sendable {
        public var id: String
        public var key: String
        public var name: String
        public var unit: String
        public var kind: BusinessMetricKind
        public var currency: String?

        public init(
            id: String,
            key: String,
            name: String,
            unit: String,
            kind: BusinessMetricKind,
            currency: String? = nil
        ) {
            self.id = id
            self.key = key
            self.name = name
            self.unit = unit
            self.kind = kind
            self.currency = currency
        }
    }

    public enum Mode: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case unitCost
        case margin
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "unit_cost": self = .unitCost
            case "margin": self = .margin
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .unitCost: return "unit_cost"
            case .margin: return "margin"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Mode] = [
            .unitCost,
            .margin,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Binning: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case daily
        case weekly
        case monthly
        case cumulative
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "daily": self = .daily
            case "weekly": self = .weekly
            case "monthly": self = .monthly
            case "cumulative": self = .cumulative
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .daily: return "daily"
            case .weekly: return "weekly"
            case .monthly: return "monthly"
            case .cumulative: return "cumulative"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Binning] = [
            .daily,
            .weekly,
            .monthly,
            .cumulative,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public struct Conversion: Codable, Hashable, Sendable {
        public struct Converted: Codable, Hashable, Sendable {
            public struct Rate: Codable, Hashable, Sendable {
                public var effectiveFrom: String
                public var rate: Double

                public init(
                    effectiveFrom: String,
                    rate: Double
                ) {
                    self.effectiveFrom = effectiveFrom
                    self.rate = rate
                }
            }

            public var currency: String
            public var rates: [Rate]

            public init(
                currency: String,
                rates: [Rate]
            ) {
                self.currency = currency
                self.rates = rates
            }
        }

        public var displayCurrency: String
        public var converted: [Converted]
        public var unconverted: [String]

        public init(
            displayCurrency: String,
            converted: [Converted],
            unconverted: [String]
        ) {
            self.displayCurrency = displayCurrency
            self.converted = converted
            self.unconverted = unconverted
        }
    }

    public var metric: Metric
    public var mode: Mode
    public var binning: Binning
    /// One series per currency the numerator ended up in — usually one. More than
    /// one means the organization has spend in a currency it holds no rate for;
    /// rather than dropping that spend (understating every unit cost) or adding
    /// it to another currency (inventing a number), each currency divides the
    /// same denominator on its own.
    public var series: [UnitCostSeries]
    /// Set only when spend currencies were folded together; absent means
    /// untouched.
    public var conversion: Conversion?
    /// Buckets on the axis that produced no ratio at all.
    public var gapBuckets: Int
    /// Buckets whose denominator covers only part of the bucket.
    public var partialBuckets: Int

    public init(
        metric: Metric,
        mode: Mode,
        binning: Binning,
        series: [UnitCostSeries],
        conversion: Conversion? = nil,
        gapBuckets: Int,
        partialBuckets: Int
    ) {
        self.metric = metric
        self.mode = mode
        self.binning = binning
        self.series = series
        self.conversion = conversion
        self.gapBuckets = gapBuckets
        self.partialBuckets = partialBuckets
    }
}
