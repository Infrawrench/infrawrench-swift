/*
 * InfrawrenchSDK v1.29.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Where opening the event should go — a hint rather than a URL, because each
/// surface addresses its own pages differently.
///
/// The API may send `null` in place of this, which is why references to it are
/// optional.
///
/// The spec allows several shapes here. Decoding tries the branches in spec
/// order, so the most specific match wins.
public enum CalendarEventLink: Codable, Hashable, Sendable {
    public struct CalendarEventLinkObject: Codable, Hashable, Sendable {
        public enum Target: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case resource
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "resource": self = .resource
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .resource: return "resource"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Target] = [
                .resource,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var target: Target
        public var accountId: String
        public var resourceId: String

        public init(
            target: Target,
            accountId: String,
            resourceId: String
        ) {
            self.target = target
            self.accountId = accountId
            self.resourceId = resourceId
        }
    }

    public struct CalendarEventLinkObject2: Codable, Hashable, Sendable {
        public enum Target: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case tab
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "tab": self = .tab
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .tab: return "tab"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Target] = [
                .tab,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public enum Tab: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case expiring
            case incidents
            case workflows
            case costs
            case settings
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "expiring": self = .expiring
                case "incidents": self = .incidents
                case "workflows": self = .workflows
                case "costs": self = .costs
                case "settings": self = .settings
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .expiring: return "expiring"
                case .incidents: return "incidents"
                case .workflows: return "workflows"
                case .costs: return "costs"
                case .settings: return "settings"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Tab] = [
                .expiring,
                .incidents,
                .workflows,
                .costs,
                .settings,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var target: Target
        public var tab: Tab

        public init(
            target: Target,
            tab: Tab
        ) {
            self.target = target
            self.tab = tab
        }
    }

    case object(CalendarEventLinkObject)
    case object2(CalendarEventLinkObject2)
    /// A shape none of the branches above matched.
    case other(JSONValue)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(CalendarEventLinkObject.self) {
            self = .object(value)
            return
        }
        if let value = try? container.decode(CalendarEventLinkObject2.self) {
            self = .object2(value)
            return
        }
        self = .other(try container.decode(JSONValue.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .object(let value): try container.encode(value)
        case .object2(let value): try container.encode(value)
        case .other(let value): try container.encode(value)
        }
    }
}
