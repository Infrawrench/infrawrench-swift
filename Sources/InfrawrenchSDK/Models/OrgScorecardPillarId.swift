/*
 * InfrawrenchSDK v1.84.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.84.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Which existing feed the org grade pillar reads. Each is a reading of a feed
/// that already exists, so a pillar can never disagree with the page it links to.
public enum OrgScorecardPillarId: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case posture
    case recoverability
    case services
    case deadlines
    case access
    case headroom
    case ownership
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "posture": self = .posture
        case "recoverability": self = .recoverability
        case "services": self = .services
        case "deadlines": self = .deadlines
        case "access": self = .access
        case "headroom": self = .headroom
        case "ownership": self = .ownership
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .posture: return "posture"
        case .recoverability: return "recoverability"
        case .services: return "services"
        case .deadlines: return "deadlines"
        case .access: return "access"
        case .headroom: return "headroom"
        case .ownership: return "ownership"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [OrgScorecardPillarId] = [
        .posture,
        .recoverability,
        .services,
        .deadlines,
        .access,
        .headroom,
        .ownership,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
