/*
 * InfrawrenchSDK v1.119.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.119.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// The metric the chart draws. A result always carries every metric.
public enum CommitmentReportMetric: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case coverage
    case eligibleCoverage
    case utilization
    case effectiveSavingsRate
    case netSavings
    case onDemandRemainder
    case commitmentCost
    case usedCommitmentCost
    case unusedCommitmentCost
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "coverage": self = .coverage
        case "eligibleCoverage": self = .eligibleCoverage
        case "utilization": self = .utilization
        case "effectiveSavingsRate": self = .effectiveSavingsRate
        case "netSavings": self = .netSavings
        case "onDemandRemainder": self = .onDemandRemainder
        case "commitmentCost": self = .commitmentCost
        case "usedCommitmentCost": self = .usedCommitmentCost
        case "unusedCommitmentCost": self = .unusedCommitmentCost
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .coverage: return "coverage"
        case .eligibleCoverage: return "eligibleCoverage"
        case .utilization: return "utilization"
        case .effectiveSavingsRate: return "effectiveSavingsRate"
        case .netSavings: return "netSavings"
        case .onDemandRemainder: return "onDemandRemainder"
        case .commitmentCost: return "commitmentCost"
        case .usedCommitmentCost: return "usedCommitmentCost"
        case .unusedCommitmentCost: return "unusedCommitmentCost"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [CommitmentReportMetric] = [
        .coverage,
        .eligibleCoverage,
        .utilization,
        .effectiveSavingsRate,
        .netSavings,
        .onDemandRemainder,
        .commitmentCost,
        .usedCommitmentCost,
        .unusedCommitmentCost,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
