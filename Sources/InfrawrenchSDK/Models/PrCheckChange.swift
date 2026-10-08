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

public struct PrCheckChange: Codable, Hashable, Sendable {
    public enum Action: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case create
        case update
        case delete
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "create": self = .create
            case "update": self = .update
            case "delete": self = .delete
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .create: return "create"
            case .update: return "update"
            case .delete: return "delete"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Action] = [
            .create,
            .update,
            .delete,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public struct BlastRadius: Codable, Hashable, Sendable {
        public enum Severity: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case none
            case low
            case medium
            case high
            case unknown
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "none": self = .none
                case "low": self = .low
                case "medium": self = .medium
                case "high": self = .high
                case "unknown": self = .unknown
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .none: return "none"
                case .low: return "low"
                case .medium: return "medium"
                case .high: return "high"
                case .unknown: return "unknown"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Severity] = [
                .none,
                .low,
                .medium,
                .high,
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

        public var directDependants: Int
        public var transitiveDependants: Int
        public var references: Int
        public var severity: Severity
        public var headline: String
        public var topDependants: [String]
        public var unchecked: Int

        public init(
            directDependants: Int,
            transitiveDependants: Int,
            references: Int,
            severity: Severity,
            headline: String,
            topDependants: [String],
            unchecked: Int
        ) {
            self.directDependants = directDependants
            self.transitiveDependants = transitiveDependants
            self.references = references
            self.severity = severity
            self.headline = headline
            self.topDependants = topDependants
            self.unchecked = unchecked
        }
    }

    public struct Warning: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case rightsizing
            case tagPolicy
            case posture
            case parse
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "rightsizing": self = .rightsizing
                case "tag-policy": self = .tagPolicy
                case "posture": self = .posture
                case "parse": self = .parse
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .rightsizing: return "rightsizing"
                case .tagPolicy: return "tag-policy"
                case .posture: return "posture"
                case .parse: return "parse"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .rightsizing,
                .tagPolicy,
                .posture,
                .parse,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public enum Severity: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case notice
            case warning
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "notice": self = .notice
                case "warning": self = .warning
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .notice: return "notice"
                case .warning: return "warning"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Severity] = [
                .notice,
                .warning,
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
        public var severity: Severity
        public var message: String

        public init(
            kind: Kind,
            severity: Severity,
            message: String
        ) {
            self.kind = kind
            self.severity = severity
            self.message = message
        }
    }

    public var address: String
    public var terraformType: String
    public var action: Action
    public var path: String
    public var line: Int?
    /// The synced resource the block manages, matched through uploaded Terraform
    /// state.
    public var resourceId: String?
    public var displayName: String?
    public var pluginId: String?
    public var resourceTypeId: String?
    public var changedAttributes: [String]
    /// The block's literal `count`; null for `for_each` or a computed count.
    public var count: Int?
    public var before: PrCheckEstimateSide?
    public var after: PrCheckEstimateSide?
    /// Null when either side could not be priced; never zero for unknown.
    public var monthlyDelta: Double?
    public var currency: String?
    public var unpricedReason: String?
    public var blastRadius: BlastRadius?
    public var warnings: [Warning]

    public init(
        address: String,
        terraformType: String,
        action: Action,
        path: String,
        line: Int? = nil,
        resourceId: String? = nil,
        displayName: String? = nil,
        pluginId: String? = nil,
        resourceTypeId: String? = nil,
        changedAttributes: [String],
        count: Int? = nil,
        before: PrCheckEstimateSide? = nil,
        after: PrCheckEstimateSide? = nil,
        monthlyDelta: Double? = nil,
        currency: String? = nil,
        unpricedReason: String? = nil,
        blastRadius: BlastRadius? = nil,
        warnings: [Warning]
    ) {
        self.address = address
        self.terraformType = terraformType
        self.action = action
        self.path = path
        self.line = line
        self.resourceId = resourceId
        self.displayName = displayName
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.changedAttributes = changedAttributes
        self.count = count
        self.before = before
        self.after = after
        self.monthlyDelta = monthlyDelta
        self.currency = currency
        self.unpricedReason = unpricedReason
        self.blastRadius = blastRadius
        self.warnings = warnings
    }
}
