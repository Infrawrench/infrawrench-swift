/*
 * InfrawrenchSDK v1.70.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.70.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// What the suppression covers. On a covered day the scope's spend is set aside
/// before the day is judged; a finding that only existed because of it is stored
/// as suppressed and never alerted on, and one that survives (spend beyond the
/// expected slice) alerts as normal.
public enum CostAnomalySuppressionScope: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case provider
    case service
    case account
    case tag
    case costCentre
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "provider": self = .provider
        case "service": self = .service
        case "account": self = .account
        case "tag": self = .tag
        case "cost_centre": self = .costCentre
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .provider: return "provider"
        case .service: return "service"
        case .account: return "account"
        case .tag: return "tag"
        case .costCentre: return "cost_centre"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [CostAnomalySuppressionScope] = [
        .provider,
        .service,
        .account,
        .tag,
        .costCentre,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
