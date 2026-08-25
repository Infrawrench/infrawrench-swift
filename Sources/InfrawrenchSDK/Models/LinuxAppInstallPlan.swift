/*
 * InfrawrenchSDK v1.38.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.38.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct LinuxAppInstallPlan: Codable, Hashable, Sendable {
    public enum PackageManager: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case aptGet
        case dnf
        case yum
        case apk
        case pacman
        case zypper
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "apt-get": self = .aptGet
            case "dnf": self = .dnf
            case "yum": self = .yum
            case "apk": self = .apk
            case "pacman": self = .pacman
            case "zypper": self = .zypper
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .aptGet: return "apt-get"
            case .dnf: return "dnf"
            case .yum: return "yum"
            case .apk: return "apk"
            case .pacman: return "pacman"
            case .zypper: return "zypper"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [PackageManager] = [
            .aptGet,
            .dnf,
            .yum,
            .apk,
            .pacman,
            .zypper,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Privilege: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case root
        case sudo
        case sudoPassword
        case none
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "root": self = .root
            case "sudo": self = .sudo
            case "sudo-password": self = .sudoPassword
            case "none": self = .none
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .root: return "root"
            case .sudo: return "sudo"
            case .sudoPassword: return "sudo-password"
            case .none: return "none"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Privilege] = [
            .root,
            .sudo,
            .sudoPassword,
            .none,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var packageManager: PackageManager
    public var privilege: Privilege
    public var requirements: [LinuxAppRequirementId]
    public var packages: [String]
    /// Exactly what would run on the host, privilege prefix included.
    public var commands: [String]
    public var canInstall: Bool
    public var blockedReason: String?

    public init(
        packageManager: PackageManager,
        privilege: Privilege,
        requirements: [LinuxAppRequirementId],
        packages: [String],
        commands: [String],
        canInstall: Bool,
        blockedReason: String? = nil
    ) {
        self.packageManager = packageManager
        self.privilege = privilege
        self.requirements = requirements
        self.packages = packages
        self.commands = commands
        self.canInstall = canInstall
        self.blockedReason = blockedReason
    }
}
