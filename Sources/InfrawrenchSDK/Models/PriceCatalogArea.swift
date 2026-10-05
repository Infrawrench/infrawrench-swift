/*
 * InfrawrenchSDK v1.55.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.55.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Coarse geography. A provider without the requested region is priced in its
/// first declared region in this area.
public enum PriceCatalogArea: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case northAmerica
    case southAmerica
    case europe
    case asiaPacific
    case middleEast
    case africa
    case oceania
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "north-america": self = .northAmerica
        case "south-america": self = .southAmerica
        case "europe": self = .europe
        case "asia-pacific": self = .asiaPacific
        case "middle-east": self = .middleEast
        case "africa": self = .africa
        case "oceania": self = .oceania
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .northAmerica: return "north-america"
        case .southAmerica: return "south-america"
        case .europe: return "europe"
        case .asiaPacific: return "asia-pacific"
        case .middleEast: return "middle-east"
        case .africa: return "africa"
        case .oceania: return "oceania"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [PriceCatalogArea] = [
        .northAmerica,
        .southAmerica,
        .europe,
        .asiaPacific,
        .middleEast,
        .africa,
        .oceania,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
