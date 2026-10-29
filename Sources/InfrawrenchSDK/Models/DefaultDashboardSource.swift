/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Which layer the default came from. `user`: the caller's own pick. `role`: the
/// default an admin set for the caller's role. `org`: the organization default.
public enum DefaultDashboardSource: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case user
    case role
    case org
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "user": self = .user
        case "role": self = .role
        case "org": self = .org
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .user: return "user"
        case .role: return "role"
        case .org: return "org"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [DefaultDashboardSource] = [
        .user,
        .role,
        .org,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
