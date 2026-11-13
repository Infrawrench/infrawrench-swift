/*
 * InfrawrenchSDK v1.106.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.106.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct WorkflowRun: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case pending
        case running
        case success
        case failure
        case canceled
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "pending": self = .pending
            case "running": self = .running
            case "success": self = .success
            case "failure": self = .failure
            case "canceled": self = .canceled
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .pending: return "pending"
            case .running: return "running"
            case .success: return "success"
            case .failure: return "failure"
            case .canceled: return "canceled"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .pending,
            .running,
            .success,
            .failure,
            .canceled,
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
    /// Organization id
    public var organizationId: String
    public var workflowId: String
    public var status: Status
    /// `manual`, `cron`, `git`, `api` or `budget`.
    public var triggerSource: String
    public var logs: [WorkflowRunLog]
    public var output: JSONValue
    public var error: WorkflowRunError?
    public var startedAt: String?
    public var finishedAt: String?
    public var durationMs: Int?
    public var syncVersion: Int
    public var createdAt: String

    public init(
        id: String,
        organizationId: String,
        workflowId: String,
        status: Status,
        triggerSource: String,
        logs: [WorkflowRunLog],
        output: JSONValue,
        error: WorkflowRunError? = nil,
        startedAt: String? = nil,
        finishedAt: String? = nil,
        durationMs: Int? = nil,
        syncVersion: Int,
        createdAt: String
    ) {
        self.id = id
        self.organizationId = organizationId
        self.workflowId = workflowId
        self.status = status
        self.triggerSource = triggerSource
        self.logs = logs
        self.output = output
        self.error = error
        self.startedAt = startedAt
        self.finishedAt = finishedAt
        self.durationMs = durationMs
        self.syncVersion = syncVersion
        self.createdAt = createdAt
    }
}
