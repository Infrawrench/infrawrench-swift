/*
 * InfrawrenchSDK v1.82.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.82.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// A check type from the scorecard registry.
public enum ScorecardCheckType: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case hasOwner
    case hasOnCall
    case sloWithinBudget
    case hasRunbook
    case backupsVerified
    case noCriticalPosture
    case noOrphans
    case requiredTags
    case costWithinBudget
    case noCriticalVulnerabilities
    case changeFailureRate
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "has_owner": self = .hasOwner
        case "has_on_call": self = .hasOnCall
        case "slo_within_budget": self = .sloWithinBudget
        case "has_runbook": self = .hasRunbook
        case "backups_verified": self = .backupsVerified
        case "no_critical_posture": self = .noCriticalPosture
        case "no_orphans": self = .noOrphans
        case "required_tags": self = .requiredTags
        case "cost_within_budget": self = .costWithinBudget
        case "no_critical_vulnerabilities": self = .noCriticalVulnerabilities
        case "change_failure_rate": self = .changeFailureRate
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .hasOwner: return "has_owner"
        case .hasOnCall: return "has_on_call"
        case .sloWithinBudget: return "slo_within_budget"
        case .hasRunbook: return "has_runbook"
        case .backupsVerified: return "backups_verified"
        case .noCriticalPosture: return "no_critical_posture"
        case .noOrphans: return "no_orphans"
        case .requiredTags: return "required_tags"
        case .costWithinBudget: return "cost_within_budget"
        case .noCriticalVulnerabilities: return "no_critical_vulnerabilities"
        case .changeFailureRate: return "change_failure_rate"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [ScorecardCheckType] = [
        .hasOwner,
        .hasOnCall,
        .sloWithinBudget,
        .hasRunbook,
        .backupsVerified,
        .noCriticalPosture,
        .noOrphans,
        .requiredTags,
        .costWithinBudget,
        .noCriticalVulnerabilities,
        .changeFailureRate,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
