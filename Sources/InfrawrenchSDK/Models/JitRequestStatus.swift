/*
 * InfrawrenchSDK v1.77.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.77.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `pending` (awaiting an approver) or `timed_out`; `denied` / `cancelled`;
/// `granting` (the provider call is in flight), `active`, `grant_failed`;
/// `revoking` then `revoked` when the window ends; `revoke_failed` while a failed
/// revoke is retried.
public enum JitRequestStatus: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case pending
    case timedOut
    case denied
    case cancelled
    case granting
    case active
    case grantFailed
    case revoking
    case revoked
    case revokeFailed
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "pending": self = .pending
        case "timed_out": self = .timedOut
        case "denied": self = .denied
        case "cancelled": self = .cancelled
        case "granting": self = .granting
        case "active": self = .active
        case "grant_failed": self = .grantFailed
        case "revoking": self = .revoking
        case "revoked": self = .revoked
        case "revoke_failed": self = .revokeFailed
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .pending: return "pending"
        case .timedOut: return "timed_out"
        case .denied: return "denied"
        case .cancelled: return "cancelled"
        case .granting: return "granting"
        case .active: return "active"
        case .grantFailed: return "grant_failed"
        case .revoking: return "revoking"
        case .revoked: return "revoked"
        case .revokeFailed: return "revoke_failed"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [JitRequestStatus] = [
        .pending,
        .timedOut,
        .denied,
        .cancelled,
        .granting,
        .active,
        .grantFailed,
        .revoking,
        .revoked,
        .revokeFailed,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
