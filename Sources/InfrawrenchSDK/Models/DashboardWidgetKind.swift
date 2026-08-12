/*
 * InfrawrenchSDK v1.15.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.15.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `cost_graph` stores its whole config inline — a one-off card. `cost_report`
/// points at a saved cost report by id, so editing the report updates every
/// dashboard showing it.
public enum DashboardWidgetKind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case costGraph
    case costReport
    case budget
    case customGraph
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
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
    public static let allKnownCases: [DashboardWidgetKind] = [
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
