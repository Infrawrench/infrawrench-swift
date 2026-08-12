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

public struct CommitmentUtilization: Codable, Hashable, Sendable {
    public enum Reason: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case unitDenominated
        case noActiveDays
        case noDataDays
        case unattributedRows
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "unit_denominated": self = .unitDenominated
            case "no_active_days": self = .noActiveDays
            case "no_data_days": self = .noDataDays
            case "unattributed_rows": self = .unattributedRows
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .unitDenominated: return "unit_denominated"
            case .noActiveDays: return "no_active_days"
            case .noDataDays: return "no_data_days"
            case .unattributedRows: return "unattributed_rows"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Reason] = [
            .unitDenominated,
            .noActiveDays,
            .noDataDays,
            .unattributedRows,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// delivered ÷ obligation, unclamped (values above 1 mean spend past the
    /// commitment). **Null means not measurable** — never 0, which would read as
    /// 'unused'; the reason field says why.
    public var utilization: Double?
    /// Why utilization is null: `unit_denominated` — the commitment is in
    /// resource units (GCP CUDs) and cost rows cannot say how many ran;
    /// `no_active_days` — the term does not intersect the window; `no_data_days`
    /// — no cost data was collected on any active day; `unattributed_rows` — the
    /// account's plugin does not stamp commitment ids onto cost rows, so
    /// delivered spend would falsely read as zero.
    public var reason: Reason?
    /// hourlyCommitmentAmount × 24 × measuredDays, in the commitment's currency.
    public var obligationAmount: Double?
    public var deliveredAmount: Double
    /// Days of the window the commitment was active.
    public var activeDays: Int
    /// Active days with cost data — the only days in the obligation. Counting a
    /// day the collection never ran would make a fully-used plan read as
    /// under-utilized.
    public var measuredDays: Int
    /// Active days without cost data, reported rather than silently counted.
    public var missingDays: Int
    public var windowDays: Int

    public init(
        utilization: Double? = nil,
        reason: Reason? = nil,
        obligationAmount: Double? = nil,
        deliveredAmount: Double,
        activeDays: Int,
        measuredDays: Int,
        missingDays: Int,
        windowDays: Int
    ) {
        self.utilization = utilization
        self.reason = reason
        self.obligationAmount = obligationAmount
        self.deliveredAmount = deliveredAmount
        self.activeDays = activeDays
        self.measuredDays = measuredDays
        self.missingDays = missingDays
        self.windowDays = windowDays
    }
}
