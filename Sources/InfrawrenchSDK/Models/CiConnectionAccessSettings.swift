/*
 * InfrawrenchSDK v1.108.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.108.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CiConnectionAccessSettings: Codable, Hashable, Sendable {
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

    /// Cloud jobs may run on this connection. Needs a passing check for every
    /// kind.
    public var jobsEnabled: Bool
    public var jobKinds: [JobKind]
    public var maxConcurrentJobs: Int
    public var maxJobMinutes: Int
    /// Repositories (`owner/name`). Null: every repository the organization runs
    /// CI for.
    public var jobRepos: [String]?
    /// Branches it holds for: globs separated by commas, where `*` stops at `/`
    /// and `**` does not (`main, release/*`). Null: every branch.
    public var jobBranchPattern: String?
    /// Jobs may be lent this connection's credentials (`connections:`).
    public var lendEnabled: Bool
    /// Repositories (`owner/name`). Null: every repository the organization runs
    /// CI for.
    public var lendRepos: [String]?
    /// Branches it holds for: globs separated by commas, where `*` stops at `/`
    /// and `**` does not (`main, release/*`). Null: every branch.
    public var lendBranchPattern: String?

    public init(
        jobsEnabled: Bool,
        jobKinds: [JobKind],
        maxConcurrentJobs: Int,
        maxJobMinutes: Int,
        jobRepos: [String]? = nil,
        jobBranchPattern: String? = nil,
        lendEnabled: Bool,
        lendRepos: [String]? = nil,
        lendBranchPattern: String? = nil
    ) {
        self.jobsEnabled = jobsEnabled
        self.jobKinds = jobKinds
        self.maxConcurrentJobs = maxConcurrentJobs
        self.maxJobMinutes = maxJobMinutes
        self.jobRepos = jobRepos
        self.jobBranchPattern = jobBranchPattern
        self.lendEnabled = lendEnabled
        self.lendRepos = lendRepos
        self.lendBranchPattern = lendBranchPattern
    }
}
