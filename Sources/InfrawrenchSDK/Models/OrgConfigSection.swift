/*
 * InfrawrenchSDK v1.20.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.20.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public enum OrgConfigSection: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case budgets
    case customGraphs
    case workflows
    case dashboards
    case metricAlerts
    case probes
    case costCentres
    case tagPolicy
    case alertSettings
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "budgets": self = .budgets
        case "customGraphs": self = .customGraphs
        case "workflows": self = .workflows
        case "dashboards": self = .dashboards
        case "metricAlerts": self = .metricAlerts
        case "probes": self = .probes
        case "costCentres": self = .costCentres
        case "tagPolicy": self = .tagPolicy
        case "alertSettings": self = .alertSettings
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .budgets: return "budgets"
        case .customGraphs: return "customGraphs"
        case .workflows: return "workflows"
        case .dashboards: return "dashboards"
        case .metricAlerts: return "metricAlerts"
        case .probes: return "probes"
        case .costCentres: return "costCentres"
        case .tagPolicy: return "tagPolicy"
        case .alertSettings: return "alertSettings"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [OrgConfigSection] = [
        .budgets,
        .customGraphs,
        .workflows,
        .dashboards,
        .metricAlerts,
        .probes,
        .costCentres,
        .tagPolicy,
        .alertSettings,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
