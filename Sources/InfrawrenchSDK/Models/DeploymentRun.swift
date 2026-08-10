/*
 * InfrawrenchSDK v1.4.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.4.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DeploymentRun: Codable, Hashable, Sendable {
    public enum Origin: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case web
        case cli
        case trigger
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "web": self = .web
            case "cli": self = .cli
            case "trigger": self = .trigger
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .web: return "web"
            case .cli: return "cli"
            case .trigger: return "trigger"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Origin] = [
            .web,
            .cli,
            .trigger,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum BuildRunner: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case cloudBuild
        case ssh
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "cloud-build": self = .cloudBuild
            case "ssh": self = .ssh
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .cloudBuild: return "cloud-build"
            case .ssh: return "ssh"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [BuildRunner] = [
            .cloudBuild,
            .ssh,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var id: String
    public var env: String
    public var repo: String?
    public var branch: String?
    public var gitSha: String?
    public var image: String?
    public var status: DeployStatus
    public var origin: Origin
    public var stage: DeployStage?
    public var durationMs: Int?
    public var buildSeconds: Int?
    public var buildRunner: BuildRunner?
    public var startedAt: String

    public init(
        id: String,
        env: String,
        repo: String? = nil,
        branch: String? = nil,
        gitSha: String? = nil,
        image: String? = nil,
        status: DeployStatus,
        origin: Origin,
        stage: DeployStage? = nil,
        durationMs: Int? = nil,
        buildSeconds: Int? = nil,
        buildRunner: BuildRunner? = nil,
        startedAt: String
    ) {
        self.id = id
        self.env = env
        self.repo = repo
        self.branch = branch
        self.gitSha = gitSha
        self.image = image
        self.status = status
        self.origin = origin
        self.stage = stage
        self.durationMs = durationMs
        self.buildSeconds = buildSeconds
        self.buildRunner = buildRunner
        self.startedAt = startedAt
    }
}
