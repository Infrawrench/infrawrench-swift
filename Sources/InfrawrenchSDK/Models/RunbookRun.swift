/*
 * InfrawrenchSDK v1.37.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.37.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct RunbookRun: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case running
        case completed
        case abandoned
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "running": self = .running
            case "completed": self = .completed
            case "abandoned": self = .abandoned
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .running: return "running"
            case .completed: return "completed"
            case .abandoned: return "abandoned"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .running,
            .completed,
            .abandoned,
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
    public var runbookId: String
    /// The runbook's name when the run started.
    public var runbookName: String
    public var status: Status
    /// The incident this was performed under. Not a cascading reference: deleting
    /// the incident must not delete the record that somebody followed the
    /// failover procedure at 03:14.
    public var incidentId: String?
    public var startedByUserId: String?
    public var startedByName: String?
    public var startedAt: String
    public var completedAt: String?
    public var summary: String?
    public var steps: [RunbookRunStep]

    public init(
        id: String,
        runbookId: String,
        runbookName: String,
        status: Status,
        incidentId: String? = nil,
        startedByUserId: String? = nil,
        startedByName: String? = nil,
        startedAt: String,
        completedAt: String? = nil,
        summary: String? = nil,
        steps: [RunbookRunStep]
    ) {
        self.id = id
        self.runbookId = runbookId
        self.runbookName = runbookName
        self.status = status
        self.incidentId = incidentId
        self.startedByUserId = startedByUserId
        self.startedByName = startedByName
        self.startedAt = startedAt
        self.completedAt = completedAt
        self.summary = summary
        self.steps = steps
    }
}
