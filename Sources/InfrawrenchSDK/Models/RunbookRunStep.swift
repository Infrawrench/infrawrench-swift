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

public struct RunbookRunStep: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case manual
        case workflow
        case link
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "manual": self = .manual
            case "workflow": self = .workflow
            case "link": self = .link
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .manual: return "manual"
            case .workflow: return "workflow"
            case .link: return "link"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .manual,
            .workflow,
            .link,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case pending
        case done
        case skipped
        case failed
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "pending": self = .pending
            case "done": self = .done
            case "skipped": self = .skipped
            case "failed": self = .failed
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .pending: return "pending"
            case .done: return "done"
            case .skipped: return "skipped"
            case .failed: return "failed"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .pending,
            .done,
            .skipped,
            .failed,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var stepId: String
    /// The step's title **when the run started**. Copied rather than joined: a
    /// runbook is edited between incidents, and a postmortem showing today's
    /// wording against last month's run is not stale, it is quietly wrong.
    public var title: String
    /// What the step does. Three kinds and not a scripting language: a runbook is
    /// written by whoever is on call for whoever is on call next, and the moment
    /// it needs a language it stops being written. `workflow` is the escape hatch
    /// — anything genuinely automated belongs in a workflow, which already has a
    /// sandbox, approvals, secrets and a history.
    public var kind: Kind
    public var status: Status
    /// What the responder typed — output, or why it was skipped.
    public var note: String?
    /// The workflow run this step kicked off. Recorded here; the run itself goes
    /// through the workflow routes with their own permission, approvals and
    /// secrets.
    public var workflowRunId: String?
    public var actorUserId: String?
    public var actorName: String?
    public var updatedAt: String?

    public init(
        stepId: String,
        title: String,
        kind: Kind,
        status: Status,
        note: String? = nil,
        workflowRunId: String? = nil,
        actorUserId: String? = nil,
        actorName: String? = nil,
        updatedAt: String? = nil
    ) {
        self.stepId = stepId
        self.title = title
        self.kind = kind
        self.status = status
        self.note = note
        self.workflowRunId = workflowRunId
        self.actorUserId = actorUserId
        self.actorName = actorName
        self.updatedAt = updatedAt
    }
}
