/*
 * InfrawrenchSDK v0.3.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.3.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Normalized status reported by a plugin's renderSidebarItem/renderDetail.
public enum ResourceStatus: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case healthy
    case warning
    case error
    case unknown
    case pending
    case stopped
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "healthy": self = .healthy
        case "warning": self = .warning
        case "error": self = .error
        case "unknown": self = .unknown
        case "pending": self = .pending
        case "stopped": self = .stopped
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .healthy: return "healthy"
        case .warning: return "warning"
        case .error: return "error"
        case .unknown: return "unknown"
        case .pending: return "pending"
        case .stopped: return "stopped"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [ResourceStatus] = [
        .healthy,
        .warning,
        .error,
        .unknown,
        .pending,
        .stopped,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
