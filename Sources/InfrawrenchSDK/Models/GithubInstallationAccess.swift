/*
 * InfrawrenchSDK v1.73.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.73.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// What an installation has **accepted**. An installation made before issue
/// filing existed shows `issues: none` until an owner of the GitHub account
/// approves the app's updated permissions.
public struct GithubInstallationAccess: Codable, Hashable, Sendable {
    public enum Issues: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case none
        case read
        case write
        case admin
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "none": self = .none
            case "read": self = .read
            case "write": self = .write
            case "admin": self = .admin
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .none: return "none"
            case .read: return "read"
            case .write: return "write"
            case .admin: return "admin"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Issues] = [
            .none,
            .read,
            .write,
            .admin,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum PullRequests: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case none
        case read
        case write
        case admin
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "none": self = .none
            case "read": self = .read
            case "write": self = .write
            case "admin": self = .admin
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .none: return "none"
            case .read: return "read"
            case .write: return "write"
            case .admin: return "admin"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [PullRequests] = [
            .none,
            .read,
            .write,
            .admin,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Contents: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case none
        case read
        case write
        case admin
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "none": self = .none
            case "read": self = .read
            case "write": self = .write
            case "admin": self = .admin
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .none: return "none"
            case .read: return "read"
            case .write: return "write"
            case .admin: return "admin"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Contents] = [
            .none,
            .read,
            .write,
            .admin,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var installationId: Int
    public var accountLogin: String?
    public var issues: Issues
    public var pullRequests: PullRequests
    public var contents: Contents
    public var suspended: Bool
    public var manageUrl: String?
    /// False when GitHub could not be asked; the levels are then all `none`.
    public var checked: Bool

    public init(
        installationId: Int,
        accountLogin: String? = nil,
        issues: Issues,
        pullRequests: PullRequests,
        contents: Contents,
        suspended: Bool,
        manageUrl: String? = nil,
        checked: Bool
    ) {
        self.installationId = installationId
        self.accountLogin = accountLogin
        self.issues = issues
        self.pullRequests = pullRequests
        self.contents = contents
        self.suspended = suspended
        self.manageUrl = manageUrl
        self.checked = checked
    }
}
