/*
 * InfrawrenchSDK v1.23.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.23.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct QuotaRow: Codable, Hashable, Sendable {
    public enum Severity: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case exhausted
        case critical
        case trending
        case ok
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "exhausted": self = .exhausted
            case "critical": self = .critical
            case "trending": self = .trending
            case "ok": self = .ok
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .exhausted: return "exhausted"
            case .critical: return "critical"
            case .trending: return "trending"
            case .ok: return "ok"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Severity] = [
            .exhausted,
            .critical,
            .trending,
            .ok,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// Plugin-chosen stable id for this quota within the account.
    public var key: String
    public var accountId: String
    public var accountName: String
    public var pluginId: PluginId
    /// Provider service in the provider's own vocabulary.
    public var service: String
    public var name: String
    /// Provider region, or null for an account-wide quota. Never the string
    /// 'global'.
    public var region: String?
    /// The ceiling the provider will enforce, in `unit`.
    public var limit: Double
    /// How much of `limit` is consumed, in the same unit.
    public var used: Double
    /// used / limit. Not clamped at 1 — an over-quota reading is a real state.
    public var utilization: Double
    /// What is being counted, in the provider's own word.
    public var unit: String?
    /// Whether the provider lets the customer request an increase. Null means the
    /// plugin does not know, which is not the same as `false`.
    public var adjustable: Bool?
    /// Provider page explaining or raising this quota.
    public var docsUrl: String?
    /// When this reading was collected.
    public var observedAt: String
    /// Where the quota sits: `exhausted` (used >= limit — the provider is already
    /// refusing requests), `critical` (at or over the organization's threshold),
    /// `trending` (under the threshold, but the fitted trend reaches the limit
    /// within 30 days), or `ok`. Ordered: an exhausted quota is also over
    /// threshold and also trending, and reports as `exhausted`.
    public var severity: Severity
    public var trend: QuotaTrend

    public init(
        key: String,
        accountId: String,
        accountName: String,
        pluginId: PluginId,
        service: String,
        name: String,
        region: String? = nil,
        limit: Double,
        used: Double,
        utilization: Double,
        unit: String? = nil,
        adjustable: Bool? = nil,
        docsUrl: String? = nil,
        observedAt: String,
        severity: Severity,
        trend: QuotaTrend
    ) {
        self.key = key
        self.accountId = accountId
        self.accountName = accountName
        self.pluginId = pluginId
        self.service = service
        self.name = name
        self.region = region
        self.limit = limit
        self.used = used
        self.utilization = utilization
        self.unit = unit
        self.adjustable = adjustable
        self.docsUrl = docsUrl
        self.observedAt = observedAt
        self.severity = severity
        self.trend = trend
    }
}
