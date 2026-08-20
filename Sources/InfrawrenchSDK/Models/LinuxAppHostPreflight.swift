/*
 * InfrawrenchSDK v1.34.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.34.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct LinuxAppHostPreflight: Codable, Hashable, Sendable {
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

    public var arch: String
    public var osId: String
    public var osName: String
    public var packageManager: PackageManager?
    public var privilege: Privilege
    public var requirements: [LinuxAppRequirement]
    /// A writable, exec-capable directory was found to stage the app server in.
    /// False means every candidate is missing, unwritable, or mounted noexec —
    /// which no package fixes.
    public var staging: Bool
    public var appCount: Int
    public var ready: Bool

    public init(
        arch: String,
        osId: String,
        osName: String,
        packageManager: PackageManager? = nil,
        privilege: Privilege,
        requirements: [LinuxAppRequirement],
        staging: Bool,
        appCount: Int,
        ready: Bool
    ) {
        self.arch = arch
        self.osId = osId
        self.osName = osName
        self.packageManager = packageManager
        self.privilege = privilege
        self.requirements = requirements
        self.staging = staging
        self.appCount = appCount
        self.ready = ready
    }
}
