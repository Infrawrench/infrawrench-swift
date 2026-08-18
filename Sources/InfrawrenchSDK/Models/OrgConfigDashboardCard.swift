/*
 * InfrawrenchSDK v1.29.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// One card. Position is the index in the dashboard's `cards` array — the grid
/// order all three card kinds share.
///
/// The spec allows several shapes here. Decoding tries the branches in spec
/// order, so the most specific match wins.
public enum OrgConfigDashboardCard: Codable, Hashable, Sendable {
    public struct OrgConfigDashboardCardObject: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case widget
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "widget": self = .widget
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .widget: return "widget"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .widget,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public enum WidgetKind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case costGraph
            case costReport
            case budget
            case customGraph
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "cost_graph": self = .costGraph
                case "cost_report": self = .costReport
                case "budget": self = .budget
                case "custom_graph": self = .customGraph
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .costGraph: return "cost_graph"
                case .costReport: return "cost_report"
                case .budget: return "budget"
                case .customGraph: return "custom_graph"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [WidgetKind] = [
                .costGraph,
                .costReport,
                .budget,
                .customGraph,
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
        public var widgetKind: WidgetKind
        public var title: String?
        public var config: JsonObject?
        /// Stable slug identifying this entity across organizations. Derived from
        /// the name on export; it is what an apply matches on, so renaming an
        /// entity while keeping its key is a rename rather than a
        /// delete-and-create.
        public var budgetKey: String?
        /// Stable slug identifying this entity across organizations. Derived from
        /// the name on export; it is what an apply matches on, so renaming an
        /// entity while keeping its key is a rename rather than a
        /// delete-and-create.
        public var graphKey: String?
        public var width: Int?
        public var height: Int?

        public init(
            kind: Kind,
            widgetKind: WidgetKind,
            title: String? = nil,
            config: JsonObject? = nil,
            budgetKey: String? = nil,
            graphKey: String? = nil,
            width: Int? = nil,
            height: Int? = nil
        ) {
            self.kind = kind
            self.widgetKind = widgetKind
            self.title = title
            self.config = config
            self.budgetKey = budgetKey
            self.graphKey = graphKey
            self.width = width
            self.height = height
        }
    }

    public struct OrgConfigDashboardCardObject2: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case workflow
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "workflow": self = .workflow
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .workflow: return "workflow"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .workflow,
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
        /// Stable slug identifying this entity across organizations. Derived from
        /// the name on export; it is what an apply matches on, so renaming an
        /// entity while keeping its key is a rename rather than a
        /// delete-and-create.
        public var workflowKey: String

        public init(
            kind: Kind,
            workflowKey: String
        ) {
            self.kind = kind
            self.workflowKey = workflowKey
        }
    }

    public struct OrgConfigDashboardCardObject3: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
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
            public static let allKnownCases: [Kind] = [
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

        public var kind: Kind
        public var pluginId: String
        public var resourceTypeId: String
        public var externalId: String
        /// Display name of the owning account.
        public var account: String
        public var width: Int?
        public var height: Int?

        public init(
            kind: Kind,
            pluginId: String,
            resourceTypeId: String,
            externalId: String,
            account: String,
            width: Int? = nil,
            height: Int? = nil
        ) {
            self.kind = kind
            self.pluginId = pluginId
            self.resourceTypeId = resourceTypeId
            self.externalId = externalId
            self.account = account
            self.width = width
            self.height = height
        }
    }

    case object(OrgConfigDashboardCardObject)
    case object2(OrgConfigDashboardCardObject2)
    case object3(OrgConfigDashboardCardObject3)
    /// A shape none of the branches above matched.
    case other(JSONValue)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(OrgConfigDashboardCardObject.self) {
            self = .object(value)
            return
        }
        if let value = try? container.decode(OrgConfigDashboardCardObject2.self) {
            self = .object2(value)
            return
        }
        if let value = try? container.decode(OrgConfigDashboardCardObject3.self) {
            self = .object3(value)
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
        case .other(let value): try container.encode(value)
        }
    }
}
