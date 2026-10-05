/*
 * InfrawrenchSDK v1.71.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.71.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SavedCostFilterReferent: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case budget
        case costReport
        case costGraphWidget
        case costVisibilityScope
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "budget": self = .budget
            case "cost_report": self = .costReport
            case "cost_graph_widget": self = .costGraphWidget
            case "cost_visibility_scope": self = .costVisibilityScope
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .budget: return "budget"
            case .costReport: return "cost_report"
            case .costGraphWidget: return "cost_graph_widget"
            case .costVisibilityScope: return "cost_visibility_scope"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .budget,
            .costReport,
            .costGraphWidget,
            .costVisibilityScope,
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
    /// Budget id, report id, or dashboard-widget id.
    public var id: String
    /// Budget name, report name, or the widget's title.
    public var name: String
    /// Set for `cost_graph_widget` referents.
    public var dashboardId: String?
    public var dashboardName: String?

    public init(
        kind: Kind,
        id: String,
        name: String,
        dashboardId: String? = nil,
        dashboardName: String? = nil
    ) {
        self.kind = kind
        self.id = id
        self.name = name
        self.dashboardId = dashboardId
        self.dashboardName = dashboardName
    }
}
