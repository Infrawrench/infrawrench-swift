/*
 * InfrawrenchSDK v1.26.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.26.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CommitmentHolding: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case reservation
        case savingsPlan
        case committedUse
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "reservation": self = .reservation
            case "savings_plan": self = .savingsPlan
            case "committed_use": self = .committedUse
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .reservation: return "reservation"
            case .savingsPlan: return "savings_plan"
            case .committedUse: return "committed_use"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .reservation,
            .savingsPlan,
            .committedUse,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum PaymentOption: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case allUpfront
        case partialUpfront
        case noUpfront
        case monthly
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "all_upfront": self = .allUpfront
            case "partial_upfront": self = .partialUpfront
            case "no_upfront": self = .noUpfront
            case "monthly": self = .monthly
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .allUpfront: return "all_upfront"
            case .partialUpfront: return "partial_upfront"
            case .noUpfront: return "no_upfront"
            case .monthly: return "monthly"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [PaymentOption] = [
            .allUpfront,
            .partialUpfront,
            .noUpfront,
            .monthly,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum RecurringPeriod: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case hour
        case month
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "hour": self = .hour
            case "month": self = .month
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .hour: return "hour"
            case .month: return "month"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [RecurringPeriod] = [
            .hour,
            .month,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum State: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case active
        case expired
        case queued
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "active": self = .active
            case "expired": self = .expired
            case "queued": self = .queued
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .active: return "active"
            case .expired: return "expired"
            case .queued: return "queued"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [State] = [
            .active,
            .expired,
            .queued,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var accountId: String
    public var accountName: String
    public var pluginId: PluginId
    /// Provider-native id — the join key against cost rows' commitment dimension
    /// (an ARN where billing data carries ARNs, the bare id where it does not).
    public var commitmentId: String
    public var kind: Kind
    public var description: String
    /// Provider scope qualifier — an AZ, an instance family, 'Shared'.
    public var scope: String?
    /// Null means the commitment applies across regions (an AWS Compute Savings
    /// Plan) — a real state, rendered as 'All regions', not missing data.
    public var region: String?
    public var startDate: String?
    public var endDate: String?
    /// Provider-reported term length — never derived from the dates, which stop
    /// spanning the term once a commitment is split or merged.
    public var termDays: Int?
    public var paymentOption: PaymentOption?
    /// Null when the provider reports no money at all for this record.
    public var currency: String?
    /// Null means the provider did not report a price (Azure's list API reports
    /// none) — 'not reported', never rendered as 'free'.
    public var upfrontAmount: Double?
    public var recurringAmount: Double?
    /// Atomic with recurringAmount: an amount without a period is a 730×
    /// ambiguity.
    public var recurringPeriod: RecurringPeriod?
    /// Committed spend per hour — what utilization is measured against.
    public var hourlyCommitmentAmount: Double?
    /// Committed resource quantities for unit-denominated commitments (GCP CUDs).
    /// A record has either this or hourlyCommitmentAmount — the split decides
    /// which utilization question is even askable.
    public var unitCommitments: [CommitmentUnitAmount]?
    public var state: State
    /// The provider's own utilization aggregates (Azure reservations only),
    /// verbatim — never blended with the derived utilization below.
    public var providerUtilization: [CommitmentProviderUtilization]?
    public var lastSeenAt: String
    public var utilization: CommitmentUtilization

    public init(
        accountId: String,
        accountName: String,
        pluginId: PluginId,
        commitmentId: String,
        kind: Kind,
        description: String,
        scope: String? = nil,
        region: String? = nil,
        startDate: String? = nil,
        endDate: String? = nil,
        termDays: Int? = nil,
        paymentOption: PaymentOption? = nil,
        currency: String? = nil,
        upfrontAmount: Double? = nil,
        recurringAmount: Double? = nil,
        recurringPeriod: RecurringPeriod? = nil,
        hourlyCommitmentAmount: Double? = nil,
        unitCommitments: [CommitmentUnitAmount]? = nil,
        state: State,
        providerUtilization: [CommitmentProviderUtilization]? = nil,
        lastSeenAt: String,
        utilization: CommitmentUtilization
    ) {
        self.accountId = accountId
        self.accountName = accountName
        self.pluginId = pluginId
        self.commitmentId = commitmentId
        self.kind = kind
        self.description = description
        self.scope = scope
        self.region = region
        self.startDate = startDate
        self.endDate = endDate
        self.termDays = termDays
        self.paymentOption = paymentOption
        self.currency = currency
        self.upfrontAmount = upfrontAmount
        self.recurringAmount = recurringAmount
        self.recurringPeriod = recurringPeriod
        self.hourlyCommitmentAmount = hourlyCommitmentAmount
        self.unitCommitments = unitCommitments
        self.state = state
        self.providerUtilization = providerUtilization
        self.lastSeenAt = lastSeenAt
        self.utilization = utilization
    }
}
