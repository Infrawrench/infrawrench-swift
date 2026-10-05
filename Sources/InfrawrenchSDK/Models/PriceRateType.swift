/*
 * InfrawrenchSDK v1.54.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.54.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public enum PriceRateType: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case onDemand
    case spot
    case reserved
    case savingsPlan
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "on-demand": self = .onDemand
        case "spot": self = .spot
        case "reserved": self = .reserved
        case "savings-plan": self = .savingsPlan
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .onDemand: return "on-demand"
        case .spot: return "spot"
        case .reserved: return "reserved"
        case .savingsPlan: return "savings-plan"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [PriceRateType] = [
        .onDemand,
        .spot,
        .reserved,
        .savingsPlan,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
