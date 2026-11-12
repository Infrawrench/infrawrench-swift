/*
 * InfrawrenchSDK v1.105.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.105.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// An app the application is presented as.
public enum OrgProductId: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case infrastructure
    case costs
    case observability
    case incidents
    case security
    case delivery
    case automation
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "infrastructure": self = .infrastructure
        case "costs": self = .costs
        case "observability": self = .observability
        case "incidents": self = .incidents
        case "security": self = .security
        case "delivery": self = .delivery
        case "automation": self = .automation
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .infrastructure: return "infrastructure"
        case .costs: return "costs"
        case .observability: return "observability"
        case .incidents: return "incidents"
        case .security: return "security"
        case .delivery: return "delivery"
        case .automation: return "automation"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [OrgProductId] = [
        .infrastructure,
        .costs,
        .observability,
        .incidents,
        .security,
        .delivery,
        .automation,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
