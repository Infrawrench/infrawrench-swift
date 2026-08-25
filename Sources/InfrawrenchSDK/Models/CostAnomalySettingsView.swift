/*
 * InfrawrenchSDK v1.35.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.35.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostAnomalySettingsView: Codable, Hashable, Sendable {
    public enum SmsAlerts: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case off
        case newSource
        case all
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "off": self = .off
            case "new_source": self = .newSource
            case "all": self = .all
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .off: return "off"
            case .newSource: return "new_source"
            case .all: return "all"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [SmsAlerts] = [
            .off,
            .newSource,
            .all,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// Standard deviations above a key's own trailing mean that count as a spike.
    /// Lower is more sensitive. Bounded at 1 — below that roughly a third of
    /// ordinary days clear the bar — and at 10, above which nothing short of a
    /// 10x jump fires. Defaults to 3.
    public var sigmas: Double
    /// Minimum rise over the baseline mean before a spike alerts, in USD cents
    /// (converted per series, so it means the same real amount in every
    /// currency). Defaults to 1000 ($10).
    public var minDeltaCents: Int
    /// Minimum first-day spend before a new spend source alerts, in USD cents. A
    /// key with no prior spend has no statistical bar to clear, so this absolute
    /// floor is the only thing keeping a new $0.02/day service quiet. Defaults to
    /// 2500 ($25).
    public var newSourceMinCents: Int
    /// Which anomalies also text the organization's Twilio recipients. Defaults
    /// to `off` — an organization with Twilio configured for budgets does not
    /// start receiving anomaly texts until it asks to. `new_source` texts only
    /// about spend appearing from nothing, which is what a leaked key looks like
    /// on a bill; `all` adds spikes on existing lines. Delivery is batched — one
    /// SMS per detection pass summarizing what it alerted on, at most one every
    /// six hours per organization — and never places a voice call. Push, Slack
    /// and Teams delivery is unaffected by this setting.
    public var smsAlerts: SmsAlerts
    /// Whether an SMS raised right now could be delivered: paging enabled for the
    /// organization, Twilio credentials and a from-number stored, and at least
    /// one recipient opted into SMS. Read-only and derived — it is not accepted
    /// on PUT.
    public var smsConfigured: Bool

    public init(
        sigmas: Double,
        minDeltaCents: Int,
        newSourceMinCents: Int,
        smsAlerts: SmsAlerts,
        smsConfigured: Bool
    ) {
        self.sigmas = sigmas
        self.minDeltaCents = minDeltaCents
        self.newSourceMinCents = newSourceMinCents
        self.smsAlerts = smsAlerts
        self.smsConfigured = smsConfigured
    }
}
