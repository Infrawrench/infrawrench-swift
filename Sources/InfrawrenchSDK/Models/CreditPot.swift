/*
 * InfrawrenchSDK v1.19.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.19.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CreditPot: Codable, Hashable, Sendable {
    public enum Urgency: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case critical
        case warning
        case ok
        case unknown
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "critical": self = .critical
            case "warning": self = .warning
            case "ok": self = .ok
            case "unknown": self = .unknown
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .critical: return "critical"
            case .warning: return "warning"
            case .ok: return "ok"
            case .unknown: return "unknown"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Urgency] = [
            .critical,
            .warning,
            .ok,
            .unknown,
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
    /// The provider's own word for this pot — "Credits", "Balance".
    public var capabilityLabel: String
    public var topUpUrl: String?
    /// Stable identity for this pot within the account — a currency code, a
    /// project id — so successive readings line up into a series.
    public var potKey: String
    public var label: String
    public var remaining: Double
    public var currency: String
    /// What was granted, when the provider reports it.
    public var granted: Double?
    /// Hard expiry on the credit itself, independent of burn.
    public var creditExpiresAt: String?
    public var observedAt: String
    /// Spend per day over the observed span. **Null means there is not enough
    /// history to say** — never 0, which would read as 'nothing is being spent'.
    public var burnPerDay: Double?
    public var burnSpanDays: Double
    public var observations: Int
    /// Increases seen between consecutive readings. A top-up is recorded, never
    /// netted off the burn — subtracting the endpoints of a window containing one
    /// reports a negative burn and an infinite runway.
    public var topUps: Int
    public var runwayDays: Double?
    public var exhaustedAt: String?
    /// Nothing has been spent over the observed span.
    public var neverEmpties: Bool
    /// The credit's own expiry, not the burn rate, is the binding deadline.
    public var limitedByExpiry: Bool
    public var urgency: Urgency

    public init(
        accountId: String,
        accountName: String,
        pluginId: PluginId,
        capabilityLabel: String,
        topUpUrl: String? = nil,
        potKey: String,
        label: String,
        remaining: Double,
        currency: String,
        granted: Double? = nil,
        creditExpiresAt: String? = nil,
        observedAt: String,
        burnPerDay: Double? = nil,
        burnSpanDays: Double,
        observations: Int,
        topUps: Int,
        runwayDays: Double? = nil,
        exhaustedAt: String? = nil,
        neverEmpties: Bool,
        limitedByExpiry: Bool,
        urgency: Urgency
    ) {
        self.accountId = accountId
        self.accountName = accountName
        self.pluginId = pluginId
        self.capabilityLabel = capabilityLabel
        self.topUpUrl = topUpUrl
        self.potKey = potKey
        self.label = label
        self.remaining = remaining
        self.currency = currency
        self.granted = granted
        self.creditExpiresAt = creditExpiresAt
        self.observedAt = observedAt
        self.burnPerDay = burnPerDay
        self.burnSpanDays = burnSpanDays
        self.observations = observations
        self.topUps = topUps
        self.runwayDays = runwayDays
        self.exhaustedAt = exhaustedAt
        self.neverEmpties = neverEmpties
        self.limitedByExpiry = limitedByExpiry
        self.urgency = urgency
    }
}
