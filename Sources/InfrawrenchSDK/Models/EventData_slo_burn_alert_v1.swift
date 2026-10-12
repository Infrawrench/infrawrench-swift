/*
 * InfrawrenchSDK v1.81.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.81.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `data` of a `slo.burn_alert` event, version 1. An SLO started or stopped
/// burning its error budget, or exhausted it.
public struct EventData_slo_burn_alert_v1: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case fastBurn
        case slowBurn
        case recovered
        case exhausted
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "fast_burn": self = .fastBurn
            case "slow_burn": self = .slowBurn
            case "recovered": self = .recovered
            case "exhausted": self = .exhausted
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .fastBurn: return "fast_burn"
            case .slowBurn: return "slow_burn"
            case .recovered: return "recovered"
            case .exhausted: return "exhausted"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .fastBurn,
            .slowBurn,
            .recovered,
            .exhausted,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// SLO id.
    public var sloId: String
    /// SLO name.
    public var sloName: String
    /// What changed.
    public var status: Status
    /// The SLO target, e.g. 99.9.
    public var targetPercent: Double
    /// The SLO window in days.
    public var windowDays: Int
    /// Current SLI percent over the window.
    public var sli: Double?
    /// Fraction of the error budget left (negative when overspent).
    public var budgetRemaining: Double?
    /// Burn rate over the last hour.
    public var burnRate1h: Double?
    /// Burn rate over the last three days.
    public var burnRate3d: Double?

    public init(
        sloId: String,
        sloName: String,
        status: Status,
        targetPercent: Double,
        windowDays: Int,
        sli: Double? = nil,
        budgetRemaining: Double? = nil,
        burnRate1h: Double? = nil,
        burnRate3d: Double? = nil
    ) {
        self.sloId = sloId
        self.sloName = sloName
        self.status = status
        self.targetPercent = targetPercent
        self.windowDays = windowDays
        self.sli = sli
        self.budgetRemaining = budgetRemaining
        self.burnRate1h = burnRate1h
        self.burnRate3d = burnRate3d
    }
}
