/*
 * InfrawrenchSDK v1.67.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.67.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Time bucket of the x axis. Weeks start on Monday and quarters on the first of
/// January, April, July and October (UTC). `cumulative` is the older spelling of
/// daily bins with `cumulative: true`, kept so stored configs and existing
/// clients keep working. `hourly` is refused with a 400 while no connected
/// account stores hourly cost rows: every provider's spend is collected per UTC
/// day today (see `granularity` on /costs/status).
public enum CostBinning: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case hourly
    case daily
    case weekly
    case monthly
    case quarterly
    case cumulative
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "hourly": self = .hourly
        case "daily": self = .daily
        case "weekly": self = .weekly
        case "monthly": self = .monthly
        case "quarterly": self = .quarterly
        case "cumulative": self = .cumulative
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .hourly: return "hourly"
        case .daily: return "daily"
        case .weekly: return "weekly"
        case .monthly: return "monthly"
        case .quarterly: return "quarterly"
        case .cumulative: return "cumulative"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [CostBinning] = [
        .hourly,
        .daily,
        .weekly,
        .monthly,
        .quarterly,
        .cumulative,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
