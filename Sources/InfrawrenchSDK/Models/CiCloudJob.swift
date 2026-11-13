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

public struct CiCloudJob: Codable, Hashable, Sendable {
    public enum State: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case claiming
        case starting
        case running
        case tearingDown
        case done
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "claiming": self = .claiming
            case "starting": self = .starting
            case "running": self = .running
            case "tearing_down": self = .tearingDown
            case "done": self = .done
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .claiming: return "claiming"
            case .starting: return "starting"
            case .running: return "running"
            case .tearingDown: return "tearing_down"
            case .done: return "done"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [State] = [
            .claiming,
            .starting,
            .running,
            .tearingDown,
            .done,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var jobId: String
    public var jobName: String
    public var pipeline: String
    public var accountId: String?
    public var accountName: String?
    public var pluginId: String
    public var kind: String
    public var machine: String?
    public var region: String?
    /// `claiming`: Infrawrench is claiming it from the runner (retried when the
    /// runner pool is busy). `starting`: the machine is coming up. `running`: it
    /// called back. `tearing_down`: the job ended and its compute is being
    /// removed. `done`: removed.
    public var state: State
    public var outcome: String?
    public var reason: String?
    public var label: String?
    public var claimedAt: String
    public var finishedAt: String?

    public init(
        jobId: String,
        jobName: String,
        pipeline: String,
        accountId: String? = nil,
        accountName: String? = nil,
        pluginId: String,
        kind: String,
        machine: String? = nil,
        region: String? = nil,
        state: State,
        outcome: String? = nil,
        reason: String? = nil,
        label: String? = nil,
        claimedAt: String,
        finishedAt: String? = nil
    ) {
        self.jobId = jobId
        self.jobName = jobName
        self.pipeline = pipeline
        self.accountId = accountId
        self.accountName = accountName
        self.pluginId = pluginId
        self.kind = kind
        self.machine = machine
        self.region = region
        self.state = state
        self.outcome = outcome
        self.reason = reason
        self.label = label
        self.claimedAt = claimedAt
        self.finishedAt = finishedAt
    }
}
