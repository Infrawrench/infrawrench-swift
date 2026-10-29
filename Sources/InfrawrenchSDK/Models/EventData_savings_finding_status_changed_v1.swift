/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `data` of a `savings.finding.status_changed` event, version 1. A savings
/// finding (orphaned resource, oversized resource, extended support surcharge or
/// unused seat) moved between Ready for review, In progress, Completed and
/// Archived, by a person or because a scan stopped reporting it.
public struct EventData_savings_finding_status_changed_v1: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case orphan
        case oversized
        case extendedSupport
        case seat
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "orphan": self = .orphan
            case "oversized": self = .oversized
            case "extended_support": self = .extendedSupport
            case "seat": self = .seat
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .orphan: return "orphan"
            case .oversized: return "oversized"
            case .extendedSupport: return "extended_support"
            case .seat: return "seat"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .orphan,
            .oversized,
            .extendedSupport,
            .seat,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum PreviousStatus: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case ready
        case inProgress
        case completed
        case archived
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "ready": self = .ready
            case "in_progress": self = .inProgress
            case "completed": self = .completed
            case "archived": self = .archived
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .ready: return "ready"
            case .inProgress: return "in_progress"
            case .completed: return "completed"
            case .archived: return "archived"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [PreviousStatus] = [
            .ready,
            .inProgress,
            .completed,
            .archived,
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
        case ready
        case inProgress
        case completed
        case archived
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "ready": self = .ready
            case "in_progress": self = .inProgress
            case "completed": self = .completed
            case "archived": self = .archived
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .ready: return "ready"
            case .inProgress: return "in_progress"
            case .completed: return "completed"
            case .archived: return "archived"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .ready,
            .inProgress,
            .completed,
            .archived,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Resolution: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case manual
        case resolved
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "manual": self = .manual
            case "resolved": self = .resolved
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .manual: return "manual"
            case .resolved: return "resolved"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Resolution] = [
            .manual,
            .resolved,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// The finding key, `<kind>:<sourceId>`.
    public var key: String
    /// Which finder reported it.
    public var kind: Kind
    /// One line describing the finding.
    public var title: String
    /// Resource or seat holder display name.
    public var resourceName: String
    /// Infrawrench resource id; null for seats.
    public var resourceId: String?
    /// Provider plugin id.
    public var pluginId: String?
    /// Status before the change.
    public var previousStatus: PreviousStatus
    /// Status after the change.
    public var status: Status
    /// For Completed: a person said so, or a scan stopped reporting it.
    public var resolution: Resolution?
    /// Who changed it; null for automatic changes.
    public var changedByUserId: String?
    /// The note recorded with the change.
    public var note: String?
    /// Monthly savings at stake, in `currency`.
    public var monthlySavings: Double?
    /// ISO 4217 currency code.
    public var currency: String?
    /// When this occurrence of the finding was first observed.
    public var detectedAt: String

    public init(
        key: String,
        kind: Kind,
        title: String,
        resourceName: String,
        resourceId: String? = nil,
        pluginId: String? = nil,
        previousStatus: PreviousStatus,
        status: Status,
        resolution: Resolution? = nil,
        changedByUserId: String? = nil,
        note: String? = nil,
        monthlySavings: Double? = nil,
        currency: String? = nil,
        detectedAt: String
    ) {
        self.key = key
        self.kind = kind
        self.title = title
        self.resourceName = resourceName
        self.resourceId = resourceId
        self.pluginId = pluginId
        self.previousStatus = previousStatus
        self.status = status
        self.resolution = resolution
        self.changedByUserId = changedByUserId
        self.note = note
        self.monthlySavings = monthlySavings
        self.currency = currency
        self.detectedAt = detectedAt
    }
}
