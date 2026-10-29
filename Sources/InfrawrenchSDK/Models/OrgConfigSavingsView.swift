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

/// A saved view over the savings findings list. Per-object sharing is not
/// carried; a view an apply creates is owned by the applying user.
public struct OrgConfigSavingsView: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case open
        case ready
        case inProgress
        case completed
        case archived
        case all
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "open": self = .open
            case "ready": self = .ready
            case "in_progress": self = .inProgress
            case "completed": self = .completed
            case "archived": self = .archived
            case "all": self = .all
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .open: return "open"
            case .ready: return "ready"
            case .inProgress: return "in_progress"
            case .completed: return "completed"
            case .archived: return "archived"
            case .all: return "all"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .open,
            .ready,
            .inProgress,
            .completed,
            .archived,
            .all,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public struct Filter: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case orphan
            case oversized
            case extendedSupport
            case seat
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
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

        public struct Tag: Codable, Hashable, Sendable {
            public var key: String
            public var values: [String]?

            public init(
                key: String,
                values: [String]? = nil
            ) {
                self.key = key
                self.values = values
            }
        }

        public var kinds: [Kind]?
        public var pluginIds: [String]?
        /// Account display names; resolved to ids on apply.
        public var accounts: [String]?
        public var regions: [String]?
        public var tags: [Tag]?
        public var minMonthlySavings: Double?
        public var detectedFrom: String?
        public var detectedTo: String?
        public var search: String?

        public init(
            kinds: [Kind]? = nil,
            pluginIds: [String]? = nil,
            accounts: [String]? = nil,
            regions: [String]? = nil,
            tags: [Tag]? = nil,
            minMonthlySavings: Double? = nil,
            detectedFrom: String? = nil,
            detectedTo: String? = nil,
            search: String? = nil
        ) {
            self.kinds = kinds
            self.pluginIds = pluginIds
            self.accounts = accounts
            self.regions = regions
            self.tags = tags
            self.minMonthlySavings = minMonthlySavings
            self.detectedFrom = detectedFrom
            self.detectedTo = detectedTo
            self.search = search
        }
    }

    public struct Sort: Codable, Hashable, Sendable {
        public enum Field: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case savings
            case detected
            case name
            case statusChanged
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "savings": self = .savings
                case "detected": self = .detected
                case "name": self = .name
                case "status_changed": self = .statusChanged
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .savings: return "savings"
                case .detected: return "detected"
                case .name: return "name"
                case .statusChanged: return "status_changed"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Field] = [
                .savings,
                .detected,
                .name,
                .statusChanged,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public enum Direction: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case asc
            case desc
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "asc": self = .asc
                case "desc": self = .desc
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .asc: return "asc"
                case .desc: return "desc"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Direction] = [
                .asc,
                .desc,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var field: Field
        public var direction: Direction

        public init(
            field: Field,
            direction: Direction
        ) {
            self.field = field
            self.direction = direction
        }
    }

    /// Stable slug identifying this entity across organizations. Derived from the
    /// name on export; it is what an apply matches on, so renaming an entity
    /// while keeping its key is a rename rather than a delete-and-create.
    public var key: String
    public var name: String
    public var description: String?
    public var status: Status
    public var filter: Filter
    public var sort: Sort

    public init(
        key: String,
        name: String,
        description: String? = nil,
        status: Status,
        filter: Filter,
        sort: Sort
    ) {
        self.key = key
        self.name = name
        self.description = description
        self.status = status
        self.filter = filter
        self.sort = sort
    }
}
