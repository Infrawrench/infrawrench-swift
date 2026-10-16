/*
 * InfrawrenchSDK v1.82.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.82.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DefaultDashboardResolution: Codable, Hashable, Sendable {
    public struct RoleDefault: Codable, Hashable, Sendable {
        public var roleId: String
        public var roleName: String
        public var dashboardId: String

        public init(
            roleId: String,
            roleName: String,
            dashboardId: String
        ) {
            self.roleId = roleId
            self.roleName = roleName
            self.dashboardId = dashboardId
        }
    }

    public enum Skipped: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case user
        case role
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "user": self = .user
            case "role": self = .role
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .user: return "user"
            case .role: return "role"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Skipped] = [
            .user,
            .role,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var dashboardId: String
    public var dashboardName: String
    public var source: DefaultDashboardSource
    /// The caller's own pick, whether or not it could be used.
    public var userDefaultDashboardId: String?
    /// The role default that applies to the caller. When a member holds several
    /// roles, custom roles win over system roles, then owner, admin, member, then
    /// role name and id.
    public var roleDefault: RoleDefault?
    public var orgDefaultDashboardId: String
    /// Layers that were set but passed over because the dashboard is no longer
    /// shared with the caller.
    public var skipped: [Skipped]

    public init(
        dashboardId: String,
        dashboardName: String,
        source: DefaultDashboardSource,
        userDefaultDashboardId: String? = nil,
        roleDefault: RoleDefault? = nil,
        orgDefaultDashboardId: String,
        skipped: [Skipped]
    ) {
        self.dashboardId = dashboardId
        self.dashboardName = dashboardName
        self.source = source
        self.userDefaultDashboardId = userDefaultDashboardId
        self.roleDefault = roleDefault
        self.orgDefaultDashboardId = orgDefaultDashboardId
        self.skipped = skipped
    }
}
