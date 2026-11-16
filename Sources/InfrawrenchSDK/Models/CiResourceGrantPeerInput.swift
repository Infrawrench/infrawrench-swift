/*
 * InfrawrenchSDK v1.113.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.113.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CiResourceGrantPeerInput: Codable, Hashable, Sendable {
    public enum JobKind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case vm
        case container
        case build
        case host
        case cluster
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "vm": self = .vm
            case "container": self = .container
            case "build": self = .build
            case "host": self = .host
            case "cluster": self = .cluster
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .vm: return "vm"
            case .container: return "container"
            case .build: return "build"
            case .host: return "host"
            case .cluster: return "cluster"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [JobKind] = [
            .vm,
            .container,
            .build,
            .host,
            .cluster,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var pluginId: String
    /// Lend it to jobs that name it in `connections:`.
    public var lend: Bool
    /// Cloud jobs that may run on it. A kind turned on is checked first, through
    /// the peer, and refused when the check fails.
    public var jobKinds: [JobKind]
    public var maxConcurrentJobs: Int
    public var maxJobMinutes: Int
    /// Where else jobs may run with `cloud.region`, each checked through the peer
    /// when added. Empty: only where each kind was checked.
    public var jobRegions: [String]

    public init(
        pluginId: String,
        lend: Bool,
        jobKinds: [JobKind],
        maxConcurrentJobs: Int,
        maxJobMinutes: Int,
        jobRegions: [String]
    ) {
        self.pluginId = pluginId
        self.lend = lend
        self.jobKinds = jobKinds
        self.maxConcurrentJobs = maxConcurrentJobs
        self.maxJobMinutes = maxJobMinutes
        self.jobRegions = jobRegions
    }
}
