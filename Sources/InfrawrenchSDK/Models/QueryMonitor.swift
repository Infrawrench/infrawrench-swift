/*
 * InfrawrenchSDK v1.38.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.38.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct QueryMonitor: Codable, Hashable, Sendable {
    public enum Mode: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case scalar
        case rowCount
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "scalar": self = .scalar
            case "rowCount": self = .rowCount
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .scalar: return "scalar"
            case .rowCount: return "rowCount"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Mode] = [
            .scalar,
            .rowCount,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Operator: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case gt
        case gte
        case lt
        case lte
        case eq
        case neq
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "gt": self = .gt
            case "gte": self = .gte
            case "lt": self = .lt
            case "lte": self = .lte
            case "eq": self = .eq
            case "neq": self = .neq
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .gt: return "gt"
            case .gte: return "gte"
            case .lt: return "lt"
            case .lte: return "lte"
            case .eq: return "eq"
            case .neq: return "neq"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Operator] = [
            .gt,
            .gte,
            .lt,
            .lte,
            .eq,
            .neq,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum State: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case ok
        case breaching
        case unknown
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "ok": self = .ok
            case "breaching": self = .breaching
            case "unknown": self = .unknown
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .ok: return "ok"
            case .breaching: return "breaching"
            case .unknown: return "unknown"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [State] = [
            .ok,
            .breaching,
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

    public var id: String
    public var name: String
    public var description: String?
    public var accountId: String
    public var accountName: String?
    public var resourceId: String?
    public var resourceTypeId: String?
    public var resourceName: String?
    public var sql: String
    /// How the result is reduced to one number. `scalar` reads the first column
    /// of the first row; `rowCount` counts the rows, which is what lets `SELECT …
    /// WHERE broken` be a monitor.
    public var mode: Mode
    public var `operator`: Operator
    public var threshold: Double
    public var intervalMinutes: Int
    /// Consecutive breaching runs before the alert fires. A query against a live
    /// table is a sample: a count that dips while a batch job is mid-write is not
    /// an incident, and a monitor that pages on it gets muted within a week.
    public var consecutiveBreaches: Int
    public var enabled: Bool
    /// `unknown` is a first-class state, not an absence: a monitor whose query
    /// failed has not told you the data is fine, and rendering that as `ok` is
    /// how a broken monitor becomes indistinguishable from a healthy one.
    public var state: State
    public var lastValue: Double?
    public var lastRunAt: String?
    /// Why the last run said nothing. Kept apart from the state because 'the
    /// monitor is broken' and 'the data is bad' need different people.
    public var lastError: String?
    public var breachStreak: Int
    public var lastAlertedAt: String?
    public var createdByUserId: String?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        name: String,
        description: String? = nil,
        accountId: String,
        accountName: String? = nil,
        resourceId: String? = nil,
        resourceTypeId: String? = nil,
        resourceName: String? = nil,
        sql: String,
        mode: Mode,
        `operator`: Operator,
        threshold: Double,
        intervalMinutes: Int,
        consecutiveBreaches: Int,
        enabled: Bool,
        state: State,
        lastValue: Double? = nil,
        lastRunAt: String? = nil,
        lastError: String? = nil,
        breachStreak: Int,
        lastAlertedAt: String? = nil,
        createdByUserId: String? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.accountId = accountId
        self.accountName = accountName
        self.resourceId = resourceId
        self.resourceTypeId = resourceTypeId
        self.resourceName = resourceName
        self.sql = sql
        self.mode = mode
        self.`operator` = `operator`
        self.threshold = threshold
        self.intervalMinutes = intervalMinutes
        self.consecutiveBreaches = consecutiveBreaches
        self.enabled = enabled
        self.state = state
        self.lastValue = lastValue
        self.lastRunAt = lastRunAt
        self.lastError = lastError
        self.breachStreak = breachStreak
        self.lastAlertedAt = lastAlertedAt
        self.createdByUserId = createdByUserId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
