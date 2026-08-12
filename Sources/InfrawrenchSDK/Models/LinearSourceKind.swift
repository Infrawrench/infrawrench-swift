/*
 * InfrawrenchSDK v1.21.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.21.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Which detector produced the finding the issue was filed from.
public enum LinearSourceKind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case costAnomaly
    case orphan
    case oversized
    case postureFinding
    case expiring
    case probe
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "cost_anomaly": self = .costAnomaly
        case "orphan": self = .orphan
        case "oversized": self = .oversized
        case "posture_finding": self = .postureFinding
        case "expiring": self = .expiring
        case "probe": self = .probe
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .costAnomaly: return "cost_anomaly"
        case .orphan: return "orphan"
        case .oversized: return "oversized"
        case .postureFinding: return "posture_finding"
        case .expiring: return "expiring"
        case .probe: return "probe"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [LinearSourceKind] = [
        .costAnomaly,
        .orphan,
        .oversized,
        .postureFinding,
        .expiring,
        .probe,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
