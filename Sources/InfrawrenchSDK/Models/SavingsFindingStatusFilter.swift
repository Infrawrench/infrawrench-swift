/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Status tab. Defaults to `all` (or the view's).
public enum SavingsFindingStatusFilter: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case open
    case ready
    case inProgress
    case completed
    case archived
    case all
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "open": self = .open
        case "ready": self = .ready
        case "in_progress": self = .inProgress
        case "completed": self = .completed
        case "archived": self = .archived
        case "all": self = .all
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .open: return "open"
        case .ready: return "ready"
        case .inProgress: return "in_progress"
        case .completed: return "completed"
        case .archived: return "archived"
        case .all: return "all"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [SavingsFindingStatusFilter] = [
        .open,
        .ready,
        .inProgress,
        .completed,
        .archived,
        .all,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
