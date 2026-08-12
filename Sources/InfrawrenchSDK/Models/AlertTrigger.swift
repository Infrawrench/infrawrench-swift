/*
 * InfrawrenchSDK v1.16.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.16.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// A kind of alert that can be routed.
public enum AlertTrigger: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case syncIncidents
    case budgetAlerts
    case anomalyAlerts
    case costChangeAlerts
    case commitmentExpiryAlerts
    case commitmentIdleAlerts
    case unitCostRegressionAlerts
    case metricAlerts
    case resourceDrift
    case workflowPages
    case providerIncidents
    case expiryAlerts
    case logMatchAlerts
    case postureAlerts
    case probeAlerts
    case quotaAlerts
    case incidentAlerts
    case weeklyDigest
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "syncIncidents": self = .syncIncidents
        case "budgetAlerts": self = .budgetAlerts
        case "anomalyAlerts": self = .anomalyAlerts
        case "costChangeAlerts": self = .costChangeAlerts
        case "commitmentExpiryAlerts": self = .commitmentExpiryAlerts
        case "commitmentIdleAlerts": self = .commitmentIdleAlerts
        case "unitCostRegressionAlerts": self = .unitCostRegressionAlerts
        case "metricAlerts": self = .metricAlerts
        case "resourceDrift": self = .resourceDrift
        case "workflowPages": self = .workflowPages
        case "providerIncidents": self = .providerIncidents
        case "expiryAlerts": self = .expiryAlerts
        case "logMatchAlerts": self = .logMatchAlerts
        case "postureAlerts": self = .postureAlerts
        case "probeAlerts": self = .probeAlerts
        case "quotaAlerts": self = .quotaAlerts
        case "incidentAlerts": self = .incidentAlerts
        case "weeklyDigest": self = .weeklyDigest
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .syncIncidents: return "syncIncidents"
        case .budgetAlerts: return "budgetAlerts"
        case .anomalyAlerts: return "anomalyAlerts"
        case .costChangeAlerts: return "costChangeAlerts"
        case .commitmentExpiryAlerts: return "commitmentExpiryAlerts"
        case .commitmentIdleAlerts: return "commitmentIdleAlerts"
        case .unitCostRegressionAlerts: return "unitCostRegressionAlerts"
        case .metricAlerts: return "metricAlerts"
        case .resourceDrift: return "resourceDrift"
        case .workflowPages: return "workflowPages"
        case .providerIncidents: return "providerIncidents"
        case .expiryAlerts: return "expiryAlerts"
        case .logMatchAlerts: return "logMatchAlerts"
        case .postureAlerts: return "postureAlerts"
        case .probeAlerts: return "probeAlerts"
        case .quotaAlerts: return "quotaAlerts"
        case .incidentAlerts: return "incidentAlerts"
        case .weeklyDigest: return "weeklyDigest"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [AlertTrigger] = [
        .syncIncidents,
        .budgetAlerts,
        .anomalyAlerts,
        .costChangeAlerts,
        .commitmentExpiryAlerts,
        .commitmentIdleAlerts,
        .unitCostRegressionAlerts,
        .metricAlerts,
        .resourceDrift,
        .workflowPages,
        .providerIncidents,
        .expiryAlerts,
        .logMatchAlerts,
        .postureAlerts,
        .probeAlerts,
        .quotaAlerts,
        .incidentAlerts,
        .weeklyDigest,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
