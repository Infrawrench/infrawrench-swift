/*
 * InfrawrenchSDK v1.78.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.78.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct Slo: Codable, Hashable, Sendable {
    public enum SliKind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case probeAvailability
        case probeLatency
        case metricThreshold
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "probe_availability": self = .probeAvailability
            case "probe_latency": self = .probeLatency
            case "metric_threshold": self = .metricThreshold
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .probeAvailability: return "probe_availability"
            case .probeLatency: return "probe_latency"
            case .metricThreshold: return "metric_threshold"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [SliKind] = [
            .probeAvailability,
            .probeLatency,
            .metricThreshold,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Comparator: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case value1
        case value2
        case value3
        case value4
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "<": self = .value1
            case "<=": self = .value2
            case ">": self = .value3
            case ">=": self = .value4
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .value1: return "<"
            case .value2: return "<="
            case .value3: return ">"
            case .value4: return ">="
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Comparator] = [
            .value1,
            .value2,
            .value3,
            .value4,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case exhausted
        case fastBurn
        case slowBurn
        case ok
        case unknown
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "exhausted": self = .exhausted
            case "fast_burn": self = .fastBurn
            case "slow_burn": self = .slowBurn
            case "ok": self = .ok
            case "unknown": self = .unknown
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .exhausted: return "exhausted"
            case .fastBurn: return "fast_burn"
            case .slowBurn: return "slow_burn"
            case .ok: return "ok"
            case .unknown: return "unknown"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .exhausted,
            .fastBurn,
            .slowBurn,
            .ok,
            .unknown,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum BurnAlert: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case none
        case slow
        case fast
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "none": self = .none
            case "slow": self = .slow
            case "fast": self = .fast
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .none: return "none"
            case .slow: return "slow"
            case .fast: return "fast"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [BurnAlert] = [
            .none,
            .slow,
            .fast,
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
    /// Unique in the organization; at most 120 characters.
    public var name: String
    /// At most 500 characters.
    public var description: String?
    /// Objective as a percentage, at least 50 and at most 99.999.
    public var targetPercent: Double
    /// Rolling window in days.
    public var windowDays: Double
    /// Route burn-rate and exhaustion alerts through the org's alert routing
    /// rules.
    public var alertsEnabled: Bool
    /// When the budget runs out, the alert and the page suggest a change freeze.
    public var suggestFreeze: Bool
    public var enabled: Bool
    /// Where the SLI comes from: a synthetic probe's success ratio, the share of
    /// a probe's checks at or under a latency threshold, or the share of minutes
    /// a resource's metric series satisfies a comparison.
    public var sliKind: SliKind
    /// `probe_*`: the synthetic probe the SLI is read from.
    public var probeId: String?
    /// `probe_latency`: a check is good at or under this many ms (1-60000).
    public var latencyThresholdMs: Int?
    /// `metric_threshold`: the synced resource reporting the series.
    public var resourceId: String?
    /// `metric_threshold`: the series label as the resource reports it, e.g. "CPU
    /// %".
    public var metricKey: String?
    /// `metric_threshold` only: a minute is good when `value <comparator>
    /// threshold`.
    public var comparator: Comparator?
    /// `metric_threshold`: the comparison's right side.
    public var threshold: Double?
    /// The probe's name; null when it was deleted.
    public var probeName: String?
    /// The resource's name; null when it is gone.
    public var resourceName: String?
    public var accountId: String?
    public var pluginId: PluginId?
    public var resourceTypeId: String?
    /// Worst true thing first: `exhausted` (no budget left), `fast_burn` (a
    /// page-severity burn-rate pair is firing), `slow_burn` (the ticket pair),
    /// `ok`, or `unknown` (no data in the window, never evaluated, or disabled).
    public var status: Status
    /// Fraction of good events over the window (0-1).
    public var sli: Double?
    public var goodEvents: Double
    /// Minutes with data in the window.
    public var totalEvents: Double
    /// Fraction of the window's error budget left; negative when overspent.
    public var budgetRemaining: Double?
    /// The window's whole budget in minutes (43.2 for 99.9% over 30 days).
    public var budgetTotalMinutes: Double
    public var budgetRemainingMinutes: Double?
    /// Burn rate per window (`5m`, `30m`, `1h`, `6h`, `3d`); 1 is exactly on
    /// budget, null where the window held no events.
    public var burnRates: [String: Double?]
    /// The alert level the evaluator last settled on.
    public var burnAlert: BurnAlert
    public var exhaustedAt: String?
    public var lastEvalAt: String?
    public var lastError: String?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        name: String,
        description: String? = nil,
        targetPercent: Double,
        windowDays: Double,
        alertsEnabled: Bool,
        suggestFreeze: Bool,
        enabled: Bool,
        sliKind: SliKind,
        probeId: String? = nil,
        latencyThresholdMs: Int? = nil,
        resourceId: String? = nil,
        metricKey: String? = nil,
        comparator: Comparator? = nil,
        threshold: Double? = nil,
        probeName: String? = nil,
        resourceName: String? = nil,
        accountId: String? = nil,
        pluginId: PluginId? = nil,
        resourceTypeId: String? = nil,
        status: Status,
        sli: Double? = nil,
        goodEvents: Double,
        totalEvents: Double,
        budgetRemaining: Double? = nil,
        budgetTotalMinutes: Double,
        budgetRemainingMinutes: Double? = nil,
        burnRates: [String: Double?],
        burnAlert: BurnAlert,
        exhaustedAt: String? = nil,
        lastEvalAt: String? = nil,
        lastError: String? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.targetPercent = targetPercent
        self.windowDays = windowDays
        self.alertsEnabled = alertsEnabled
        self.suggestFreeze = suggestFreeze
        self.enabled = enabled
        self.sliKind = sliKind
        self.probeId = probeId
        self.latencyThresholdMs = latencyThresholdMs
        self.resourceId = resourceId
        self.metricKey = metricKey
        self.comparator = comparator
        self.threshold = threshold
        self.probeName = probeName
        self.resourceName = resourceName
        self.accountId = accountId
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.status = status
        self.sli = sli
        self.goodEvents = goodEvents
        self.totalEvents = totalEvents
        self.budgetRemaining = budgetRemaining
        self.budgetTotalMinutes = budgetTotalMinutes
        self.budgetRemainingMinutes = budgetRemainingMinutes
        self.burnRates = burnRates
        self.burnAlert = burnAlert
        self.exhaustedAt = exhaustedAt
        self.lastEvalAt = lastEvalAt
        self.lastError = lastError
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
