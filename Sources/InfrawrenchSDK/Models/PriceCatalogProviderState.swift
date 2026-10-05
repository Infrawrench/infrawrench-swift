/*
 * InfrawrenchSDK v1.69.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.69.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `no-account`: the provider's price API needs credentials and the org has no
/// account on it. `loading`: the first fetch is still running, ask again shortly.
public enum PriceCatalogProviderState: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case ready
    case noAccount
    case noRegion
    case loading
    case error
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "ready": self = .ready
        case "no-account": self = .noAccount
        case "no-region": self = .noRegion
        case "loading": self = .loading
        case "error": self = .error
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .ready: return "ready"
        case .noAccount: return "no-account"
        case .noRegion: return "no-region"
        case .loading: return "loading"
        case .error: return "error"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [PriceCatalogProviderState] = [
        .ready,
        .noAccount,
        .noRegion,
        .loading,
        .error,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
