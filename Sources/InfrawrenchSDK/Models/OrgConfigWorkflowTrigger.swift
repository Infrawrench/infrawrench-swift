/*
 * InfrawrenchSDK v1.37.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.37.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// The spec allows several shapes here. Decoding tries the branches in spec
/// order, so the most specific match wins.
public enum OrgConfigWorkflowTrigger: Codable, Hashable, Sendable {
    public struct OrgConfigWorkflowTriggerObject: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case manual
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "manual": self = .manual
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .manual: return "manual"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
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

        public var kind: Kind

        public init(
            kind: Kind
        ) {
            self.kind = kind
        }
    }

    public struct OrgConfigWorkflowTriggerObject2: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case cron
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "cron": self = .cron
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .cron: return "cron"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .cron,
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
        public var expression: String
        public var timezone: String?

        public init(
            kind: Kind,
            expression: String,
            timezone: String? = nil
        ) {
            self.kind = kind
            self.expression = expression
            self.timezone = timezone
        }
    }

    public struct OrgConfigWorkflowTriggerObject3: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case git
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "git": self = .git
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .git: return "git"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .git,
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
        public var provider: String?
        public var repo: String?
        public var branch: String?
        public var events: [String]?
        public var installationId: Int?

        public init(
            kind: Kind,
            provider: String? = nil,
            repo: String? = nil,
            branch: String? = nil,
            events: [String]? = nil,
            installationId: Int? = nil
        ) {
            self.kind = kind
            self.provider = provider
            self.repo = repo
            self.branch = branch
            self.events = events
            self.installationId = installationId
        }
    }

    public struct OrgConfigWorkflowTriggerObject4: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case budget
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "budget": self = .budget
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .budget: return "budget"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .budget,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public enum Metric: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
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
            public static let allKnownCases: [Metric] = [
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

        public var kind: Kind
        /// `key` of an entry in this document's `budgets` (never a row id).
        public var budgetKey: String
        public var percent: Double?
        public var metric: Metric?

        public init(
            kind: Kind,
            budgetKey: String,
            percent: Double? = nil,
            metric: Metric? = nil
        ) {
            self.kind = kind
            self.budgetKey = budgetKey
            self.percent = percent
            self.metric = metric
        }
    }

    case object(OrgConfigWorkflowTriggerObject)
    case object2(OrgConfigWorkflowTriggerObject2)
    case object3(OrgConfigWorkflowTriggerObject3)
    case object4(OrgConfigWorkflowTriggerObject4)
    /// A shape none of the branches above matched.
    case other(JSONValue)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(OrgConfigWorkflowTriggerObject.self) {
            self = .object(value)
            return
        }
        if let value = try? container.decode(OrgConfigWorkflowTriggerObject2.self) {
            self = .object2(value)
            return
        }
        if let value = try? container.decode(OrgConfigWorkflowTriggerObject3.self) {
            self = .object3(value)
            return
        }
        if let value = try? container.decode(OrgConfigWorkflowTriggerObject4.self) {
            self = .object4(value)
            return
        }
        self = .other(try container.decode(JSONValue.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .object(let value): try container.encode(value)
        case .object2(let value): try container.encode(value)
        case .object3(let value): try container.encode(value)
        case .object4(let value): try container.encode(value)
        case .other(let value): try container.encode(value)
        }
    }
}
