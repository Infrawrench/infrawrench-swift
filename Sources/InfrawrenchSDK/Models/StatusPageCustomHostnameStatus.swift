/*
 * InfrawrenchSDK v1.36.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.36.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public enum StatusPageCustomHostnameStatus: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case none
    case pendingDns
    case pendingSsl
    case active
    case error
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "none": self = .none
        case "pending_dns": self = .pendingDns
        case "pending_ssl": self = .pendingSsl
        case "active": self = .active
        case "error": self = .error
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .none: return "none"
        case .pendingDns: return "pending_dns"
        case .pendingSsl: return "pending_ssl"
        case .active: return "active"
        case .error: return "error"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [StatusPageCustomHostnameStatus] = [
        .none,
        .pendingDns,
        .pendingSsl,
        .active,
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
