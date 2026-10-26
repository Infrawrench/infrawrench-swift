/*
 * InfrawrenchSDK v1.84.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.84.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Tracker-neutral progress. Jira's status category, Linear's workflow state
/// type, and GitHub's state and close reason all map onto these four.
///
/// The API may send `null` in place of this, which is why references to it are
/// optional.
public enum IssueStatusCategory: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
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
    public static let allKnownCases: [IssueStatusCategory] = [
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
