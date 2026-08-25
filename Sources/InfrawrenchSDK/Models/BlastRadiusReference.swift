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

public struct BlastRadiusReference: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case dashboard
        case customGraph
        case probe
        case statusPage
        case metricAlert
        case lease
        case schedule
        case workflow
        case logQuery
        case owner
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "dashboard": self = .dashboard
            case "custom-graph": self = .customGraph
            case "probe": self = .probe
            case "status-page": self = .statusPage
            case "metric-alert": self = .metricAlert
            case "lease": self = .lease
            case "schedule": self = .schedule
            case "workflow": self = .workflow
            case "log-query": self = .logQuery
            case "owner": self = .owner
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .dashboard: return "dashboard"
            case .customGraph: return "custom-graph"
            case .probe: return "probe"
            case .statusPage: return "status-page"
            case .metricAlert: return "metric-alert"
            case .lease: return "lease"
            case .schedule: return "schedule"
            case .workflow: return "workflow"
            case .logQuery: return "log-query"
            case .owner: return "owner"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .dashboard,
            .customGraph,
            .probe,
            .statusPage,
            .metricAlert,
            .lease,
            .schedule,
            .workflow,
            .logQuery,
            .owner,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// What kind of object names the resource.
    public var kind: Kind
    /// The referring object's own id.
    public var id: String
    public var name: String
    /// One extra clause of context.
    public var detail: String?
    /// Set when the reference is visible outside the organization — a published
    /// status page component, or the probe behind one. Any user-facing reference
    /// makes the report high severity on its own.
    public var userFacing: Bool?

    public init(
        kind: Kind,
        id: String,
        name: String,
        detail: String? = nil,
        userFacing: Bool? = nil
    ) {
        self.kind = kind
        self.id = id
        self.name = name
        self.detail = detail
        self.userFacing = userFacing
    }
}
