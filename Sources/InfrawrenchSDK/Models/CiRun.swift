/*
 * InfrawrenchSDK v1.103.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.103.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CiRun: Codable, Hashable, Sendable {
    public enum Event: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case push
        case pullRequest
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "push": self = .push
            case "pull-request": self = .pullRequest
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .push: return "push"
            case .pullRequest: return "pull-request"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Event] = [
            .push,
            .pullRequest,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// The spec allows several shapes here. Decoding tries the branches in spec
    /// order, so the most specific match wins.
    public enum VcpuSeconds: Codable, Hashable, Sendable {
        public enum VcpuSecondsVcpuSeconds: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case infinity
            case infinity2
            case naN
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "Infinity": self = .infinity
                case "-Infinity": self = .infinity2
                case "NaN": self = .naN
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .infinity: return "Infinity"
                case .infinity2: return "-Infinity"
                case .naN: return "NaN"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [VcpuSecondsVcpuSeconds] = [
                .infinity,
                .infinity2,
                .naN,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        case double(Double)
        case vcpuSeconds(VcpuSecondsVcpuSeconds)
        /// A shape none of the branches above matched.
        case other(JSONValue)

        public init(from decoder: any Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let value = try? container.decode(Double.self) {
                self = .double(value)
                return
            }
            if let value = try? container.decode(VcpuSecondsVcpuSeconds.self) {
                self = .vcpuSeconds(value)
                return
            }
            self = .other(try container.decode(JSONValue.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .double(let value): try container.encode(value)
            case .vcpuSeconds(let value): try container.encode(value)
            case .other(let value): try container.encode(value)
            }
        }
    }

    /// The spec allows several shapes here. Decoding tries the branches in spec
    /// order, so the most specific match wins.
    public enum MemoryGibSeconds: Codable, Hashable, Sendable {
        public enum MemoryGibSecondsMemoryGibSeconds: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case infinity
            case infinity2
            case naN
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "Infinity": self = .infinity
                case "-Infinity": self = .infinity2
                case "NaN": self = .naN
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .infinity: return "Infinity"
                case .infinity2: return "-Infinity"
                case .naN: return "NaN"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [MemoryGibSecondsMemoryGibSeconds] = [
                .infinity,
                .infinity2,
                .naN,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        case double(Double)
        case memoryGibSeconds(MemoryGibSecondsMemoryGibSeconds)
        /// A shape none of the branches above matched.
        case other(JSONValue)

        public init(from decoder: any Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let value = try? container.decode(Double.self) {
                self = .double(value)
                return
            }
            if let value = try? container.decode(MemoryGibSecondsMemoryGibSeconds.self) {
                self = .memoryGibSeconds(value)
                return
            }
            self = .other(try container.decode(JSONValue.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .double(let value): try container.encode(value)
            case .memoryGibSeconds(let value): try container.encode(value)
            case .other(let value): try container.encode(value)
            }
        }
    }

    public var id: String
    public var repoFullName: String
    public var event: Event
    public var headRef: String
    public var sha: String
    public var pullNumber: Int?
    public var headRepoFullName: String?
    public var fromFork: Bool
    public var actorLogin: String?
    public var status: CiRunStatus
    public var statusReason: String?
    public var createdAt: String
    public var startedAt: String?
    public var finishedAt: String?
    public var jobs: [CiJobSummary]?
    public var vcpuSeconds: VcpuSeconds?
    public var memoryGibSeconds: MemoryGibSeconds?
    public var githubUrl: String
    /// The run this one retries: the same repository, commit, branch and event.
    public var retryOfRunId: String?
    /// The newest retry of this run.
    public var retriedAsRunId: String?
    /// The run did not read the task cache: every `task-cache:` job ran, and
    /// saved its result again.
    public var noTaskCache: Bool?

    public init(
        id: String,
        repoFullName: String,
        event: Event,
        headRef: String,
        sha: String,
        pullNumber: Int? = nil,
        headRepoFullName: String? = nil,
        fromFork: Bool,
        actorLogin: String? = nil,
        status: CiRunStatus,
        statusReason: String? = nil,
        createdAt: String,
        startedAt: String? = nil,
        finishedAt: String? = nil,
        jobs: [CiJobSummary]? = nil,
        vcpuSeconds: VcpuSeconds? = nil,
        memoryGibSeconds: MemoryGibSeconds? = nil,
        githubUrl: String,
        retryOfRunId: String? = nil,
        retriedAsRunId: String? = nil,
        noTaskCache: Bool? = nil
    ) {
        self.id = id
        self.repoFullName = repoFullName
        self.event = event
        self.headRef = headRef
        self.sha = sha
        self.pullNumber = pullNumber
        self.headRepoFullName = headRepoFullName
        self.fromFork = fromFork
        self.actorLogin = actorLogin
        self.status = status
        self.statusReason = statusReason
        self.createdAt = createdAt
        self.startedAt = startedAt
        self.finishedAt = finishedAt
        self.jobs = jobs
        self.vcpuSeconds = vcpuSeconds
        self.memoryGibSeconds = memoryGibSeconds
        self.githubUrl = githubUrl
        self.retryOfRunId = retryOfRunId
        self.retriedAsRunId = retriedAsRunId
        self.noTaskCache = noTaskCache
    }
}
