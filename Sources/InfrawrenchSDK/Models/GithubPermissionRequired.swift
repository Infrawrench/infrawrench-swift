/*
 * InfrawrenchSDK v1.71.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.71.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// The installation has not accepted the permission this needs. An owner of the
/// GitHub account approves it from `manageUrl`.
public struct GithubPermissionRequired: Codable, Hashable, Sendable {
    public enum Code: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case githubPermissionRequired
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "github_permission_required": self = .githubPermissionRequired
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .githubPermissionRequired: return "github_permission_required"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Code] = [
            .githubPermissionRequired,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var error: String
    public var code: Code
    public var permissions: [String]
    public var installationId: Int
    public var accountLogin: String?
    public var manageUrl: String?

    public init(
        error: String,
        code: Code,
        permissions: [String],
        installationId: Int,
        accountLogin: String? = nil,
        manageUrl: String? = nil
    ) {
        self.error = error
        self.code = code
        self.permissions = permissions
        self.installationId = installationId
        self.accountLogin = accountLogin
        self.manageUrl = manageUrl
    }
}
