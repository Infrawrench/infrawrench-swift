/*
 * InfrawrenchSDK v1.115.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.115.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CiResourceGrantPeer: Codable, Hashable, Sendable {
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

    /// The plugin the resource is lent as, one its type has a peer integration
    /// with (a managed cluster as `kubernetes`). Pipelines name it in
    /// `connections:` by the grant's CI name.
    public var pluginId: String
    public var pluginName: String
    /// `connections: [<ciName>]` lends it. Separate from running jobs on it,
    /// which lends nothing.
    public var lend: Bool
    /// Cloud jobs (`cloud: <pluginId>/<kind>`) that may run on it. Empty for
    /// none.
    public var jobKinds: [JobKind]
    public var maxConcurrentJobs: Int
    public var maxJobMinutes: Int
    /// Where else a job may run with `cloud.region` (a cluster's namespaces),
    /// besides where each kind was checked. Empty: only there.
    public var jobRegions: [String]
    public var preflight: [String: CiPreflightRecord]

    public init(
        pluginId: String,
        pluginName: String,
        lend: Bool,
        jobKinds: [JobKind],
        maxConcurrentJobs: Int,
        maxJobMinutes: Int,
        jobRegions: [String],
        preflight: [String: CiPreflightRecord]
    ) {
        self.pluginId = pluginId
        self.pluginName = pluginName
        self.lend = lend
        self.jobKinds = jobKinds
        self.maxConcurrentJobs = maxConcurrentJobs
        self.maxJobMinutes = maxJobMinutes
        self.jobRegions = jobRegions
        self.preflight = preflight
    }
}
