/*
 * InfrawrenchSDK v1.82.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.82.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `data` of a `issue.status_changed` event, version 1. An issue filed from a
/// finding moved to a different status in Jira, Linear or GitHub. The first
/// status Infrawrench learns for an issue is a baseline and raises nothing.
public struct EventData_issue_status_changed_v1: Codable, Hashable, Sendable {
    public enum Tracker: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case jira
        case linear
        case github
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "jira": self = .jira
            case "linear": self = .linear
            case "github": self = .github
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .jira: return "jira"
            case .linear: return "linear"
            case .github: return "github"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Tracker] = [
            .jira,
            .linear,
            .github,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum StatusCategory: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case todo
        case inProgress
        case done
        case canceled
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "todo": self = .todo
            case "in_progress": self = .inProgress
            case "done": self = .done
            case "canceled": self = .canceled
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .todo: return "todo"
            case .inProgress: return "in_progress"
            case .done: return "done"
            case .canceled: return "canceled"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [StatusCategory] = [
            .todo,
            .inProgress,
            .done,
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

    public enum PreviousStatusCategory: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case todo
        case inProgress
        case done
        case canceled
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "todo": self = .todo
            case "in_progress": self = .inProgress
            case "done": self = .done
            case "canceled": self = .canceled
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .todo: return "todo"
            case .inProgress: return "in_progress"
            case .done: return "done"
            case .canceled: return "canceled"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [PreviousStatusCategory] = [
            .todo,
            .inProgress,
            .done,
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

    /// Where the issue lives.
    public var tracker: Tracker
    /// The issue's handle: a Jira key, a Linear identifier, or owner/repo#number.
    public var issue: String
    /// The issue in the tracker.
    public var issueUrl: String
    /// The kind of finding the issue was filed from, e.g. cost_anomaly.
    public var sourceKind: String
    /// The finding's own id.
    public var sourceId: String
    /// The tracker's status name now.
    public var status: String?
    /// Tracker-neutral progress now.
    public var statusCategory: StatusCategory?
    /// The status name before.
    public var previousStatus: String?
    /// Tracker-neutral progress before.
    public var previousStatusCategory: PreviousStatusCategory?
    /// Who the issue is assigned to now.
    public var assignee: String?

    public init(
        tracker: Tracker,
        issue: String,
        issueUrl: String,
        sourceKind: String,
        sourceId: String,
        status: String? = nil,
        statusCategory: StatusCategory? = nil,
        previousStatus: String? = nil,
        previousStatusCategory: PreviousStatusCategory? = nil,
        assignee: String? = nil
    ) {
        self.tracker = tracker
        self.issue = issue
        self.issueUrl = issueUrl
        self.sourceKind = sourceKind
        self.sourceId = sourceId
        self.status = status
        self.statusCategory = statusCategory
        self.previousStatus = previousStatus
        self.previousStatusCategory = previousStatusCategory
        self.assignee = assignee
    }
}
