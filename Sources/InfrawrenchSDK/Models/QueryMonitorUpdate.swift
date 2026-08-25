/*
 * InfrawrenchSDK v1.39.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.39.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct QueryMonitorUpdate: Codable, Hashable, Sendable {
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

    public var name: String?
    public var description: String?
    public var accountId: String?
    public var resourceId: String?
    public var resourceTypeId: String?
    public var sql: String?
    /// How the result is reduced to one number. `scalar` reads the first column
    /// of the first row; `rowCount` counts the rows, which is what lets `SELECT …
    /// WHERE broken` be a monitor.
    public var mode: Mode?
    public var `operator`: Operator?
    public var threshold: Double?
    public var intervalMinutes: Int?
    public var consecutiveBreaches: Int?
    public var enabled: Bool?

    public init(
        name: String? = nil,
        description: String? = nil,
        accountId: String? = nil,
        resourceId: String? = nil,
        resourceTypeId: String? = nil,
        sql: String? = nil,
        mode: Mode? = nil,
        `operator`: Operator? = nil,
        threshold: Double? = nil,
        intervalMinutes: Int? = nil,
        consecutiveBreaches: Int? = nil,
        enabled: Bool? = nil
    ) {
        self.name = name
        self.description = description
        self.accountId = accountId
        self.resourceId = resourceId
        self.resourceTypeId = resourceTypeId
        self.sql = sql
        self.mode = mode
        self.`operator` = `operator`
        self.threshold = threshold
        self.intervalMinutes = intervalMinutes
        self.consecutiveBreaches = consecutiveBreaches
        self.enabled = enabled
    }
}
