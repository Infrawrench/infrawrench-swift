/*
 * InfrawrenchSDK v1.34.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.34.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// One of the indexed feeds the moment union draws from.
public enum MomentFeedId: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case changes
    case statusIncidents
    case costAnomalies
    case workflowRuns
    case deployments
    case audit
    case freezes
    case driftAlerts
    case expiryAlerts
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "changes": self = .changes
        case "statusIncidents": self = .statusIncidents
        case "costAnomalies": self = .costAnomalies
        case "workflowRuns": self = .workflowRuns
        case "deployments": self = .deployments
        case "audit": self = .audit
        case "freezes": self = .freezes
        case "driftAlerts": self = .driftAlerts
        case "expiryAlerts": self = .expiryAlerts
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .changes: return "changes"
        case .statusIncidents: return "statusIncidents"
        case .costAnomalies: return "costAnomalies"
        case .workflowRuns: return "workflowRuns"
        case .deployments: return "deployments"
        case .audit: return "audit"
        case .freezes: return "freezes"
        case .driftAlerts: return "driftAlerts"
        case .expiryAlerts: return "expiryAlerts"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [MomentFeedId] = [
        .changes,
        .statusIncidents,
        .costAnomalies,
        .workflowRuns,
        .deployments,
        .audit,
        .freezes,
        .driftAlerts,
        .expiryAlerts,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
