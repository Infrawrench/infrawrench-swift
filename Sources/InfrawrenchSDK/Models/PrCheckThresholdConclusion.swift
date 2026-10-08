/*
 * InfrawrenchSDK v1.79.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.79.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// What the check concludes when the priced monthly increase exceeds
/// `costThreshold`: `neutral` flags it without blocking, `failure` fails it (and
/// blocks merging where branch protection requires the check).
public enum PrCheckThresholdConclusion: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case neutral
    case failure
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "neutral": self = .neutral
        case "failure": self = .failure
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .neutral: return "neutral"
        case .failure: return "failure"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [PrCheckThresholdConclusion] = [
        .neutral,
        .failure,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
