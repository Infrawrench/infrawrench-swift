/*
 * InfrawrenchSDK v1.37.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.37.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `measured` — both windows had collected data and the delta is real.
/// `insufficient_data` — the windows exist but are too short to compare.
/// `unknown` — nothing here can answer the question. **`unknown` is never zero**:
/// a resource with no cost data reports that we cannot say, not that the change
/// was free.
public enum ChangeCostImpactStatus: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case measured
    case insufficientData
    case unknown
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "measured": self = .measured
        case "insufficient_data": self = .insufficientData
        case "unknown": self = .unknown
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .measured: return "measured"
        case .insufficientData: return "insufficient_data"
        case .unknown: return "unknown"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [ChangeCostImpactStatus] = [
        .measured,
        .insufficientData,
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
