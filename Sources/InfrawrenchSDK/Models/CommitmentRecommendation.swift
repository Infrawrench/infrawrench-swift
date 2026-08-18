/*
 * InfrawrenchSDK v1.29.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CommitmentRecommendation: Codable, Hashable, Sendable {
    public enum SavingBasis: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case range
        case upperBound
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "range": self = .range
            case "upper_bound": self = .upperBound
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .range: return "range"
            case .upperBound: return "upper_bound"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [SavingBasis] = [
            .range,
            .upperBound,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var pluginId: PluginId
    public var service: String
    public var region: String
    public var currency: String
    /// p10 of daily uncovered usage spend, nearest-rank — the floor, not the
    /// average.
    public var recommendedDailyCommitment: Double
    public var recommendedHourlyCommitment: Double
    public var annualCommitment: Double
    public var p50DailySpend: Double
    /// Published discounts are "up to" figures. `range` renders "$X–$Y";
    /// `upper_bound` renders "up to $Y" — never a bare "$Y".
    public var savingBasis: SavingBasis
    public var discountRateMin: Double?
    public var discountRateMax: Double
    public var estimatedAnnualSavingMin: Double?
    public var estimatedAnnualSavingMax: Double
    /// 1 − discount: below this utilization the commitment loses to on-demand.
    /// Equivalently, the workload can shrink by the discount before committing
    /// was a mistake.
    public var breakEvenUtilization: Double
    /// max(0, annualCommitment × (0.5 − discount)) at the shallow end of the
    /// published discount — a ceiling on regret where no floor rate is published.
    public var annualLossIfUsageHalves: Double

    public init(
        pluginId: PluginId,
        service: String,
        region: String,
        currency: String,
        recommendedDailyCommitment: Double,
        recommendedHourlyCommitment: Double,
        annualCommitment: Double,
        p50DailySpend: Double,
        savingBasis: SavingBasis,
        discountRateMin: Double? = nil,
        discountRateMax: Double,
        estimatedAnnualSavingMin: Double? = nil,
        estimatedAnnualSavingMax: Double,
        breakEvenUtilization: Double,
        annualLossIfUsageHalves: Double
    ) {
        self.pluginId = pluginId
        self.service = service
        self.region = region
        self.currency = currency
        self.recommendedDailyCommitment = recommendedDailyCommitment
        self.recommendedHourlyCommitment = recommendedHourlyCommitment
        self.annualCommitment = annualCommitment
        self.p50DailySpend = p50DailySpend
        self.savingBasis = savingBasis
        self.discountRateMin = discountRateMin
        self.discountRateMax = discountRateMax
        self.estimatedAnnualSavingMin = estimatedAnnualSavingMin
        self.estimatedAnnualSavingMax = estimatedAnnualSavingMax
        self.breakEvenUtilization = breakEvenUtilization
        self.annualLossIfUsageHalves = annualLossIfUsageHalves
    }
}
