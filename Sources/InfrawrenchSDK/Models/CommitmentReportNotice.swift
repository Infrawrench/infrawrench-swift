/*
 * InfrawrenchSDK v1.124.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.124.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `unused_lumped_monthly`: a provider in scope books a month's unused commitment
/// fee on one day of its daily data, so a daily or weekly utilization dips on
/// that day. `unattributed_commitment_usage`: some covered usage could not be
/// tied to a commitment and is grouped as `__unattributed__`.
/// `partial_savings_measurement`: some covered usage had no reported on-demand
/// equivalent and counts as saving nothing. `no_measurable_accounts`: no account
/// in scope can measure coverage.
public enum CommitmentReportNotice: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case unusedLumpedMonthly
    case unattributedCommitmentUsage
    case partialSavingsMeasurement
    case noMeasurableAccounts
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "unused_lumped_monthly": self = .unusedLumpedMonthly
        case "unattributed_commitment_usage": self = .unattributedCommitmentUsage
        case "partial_savings_measurement": self = .partialSavingsMeasurement
        case "no_measurable_accounts": self = .noMeasurableAccounts
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .unusedLumpedMonthly: return "unused_lumped_monthly"
        case .unattributedCommitmentUsage: return "unattributed_commitment_usage"
        case .partialSavingsMeasurement: return "partial_savings_measurement"
        case .noMeasurableAccounts: return "no_measurable_accounts"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [CommitmentReportNotice] = [
        .unusedLumpedMonthly,
        .unattributedCommitmentUsage,
        .partialSavingsMeasurement,
        .noMeasurableAccounts,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
