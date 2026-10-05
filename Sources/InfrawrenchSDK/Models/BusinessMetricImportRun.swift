/*
 * InfrawrenchSDK v1.74.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.74.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BusinessMetricImportRun: Codable, Hashable, Sendable {
    public enum Trigger: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case schedule
        case manual
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "schedule": self = .schedule
            case "manual": self = .manual
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .schedule: return "schedule"
            case .manual: return "manual"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Trigger] = [
            .schedule,
            .manual,
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
        case running
        case success
        case error
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "running": self = .running
            case "success": self = .success
            case "error": self = .error
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .running: return "running"
            case .success: return "success"
            case .error: return "error"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .running,
            .success,
            .error,
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
    public var importerId: String
    public var trigger: Trigger
    public var status: Status
    /// First day, inclusive, in the importer's timezone.
    public var from: String
    public var to: String
    public var pointsRead: Int
    public var daysWritten: Int
    public var error: String?
    public var notes: [String]
    public var startedAt: String
    public var finishedAt: String?
    public var durationMs: Int?

    public init(
        id: String,
        importerId: String,
        trigger: Trigger,
        status: Status,
        from: String,
        to: String,
        pointsRead: Int,
        daysWritten: Int,
        error: String? = nil,
        notes: [String],
        startedAt: String,
        finishedAt: String? = nil,
        durationMs: Int? = nil
    ) {
        self.id = id
        self.importerId = importerId
        self.trigger = trigger
        self.status = status
        self.from = from
        self.to = to
        self.pointsRead = pointsRead
        self.daysWritten = daysWritten
        self.error = error
        self.notes = notes
        self.startedAt = startedAt
        self.finishedAt = finishedAt
        self.durationMs = durationMs
    }
}
