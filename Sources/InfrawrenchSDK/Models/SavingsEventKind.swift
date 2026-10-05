/*
 * InfrawrenchSDK v1.71.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.71.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `rightsizing` — a resize to a smaller size; `orphan_deletion` — a resource the
/// orphan finder flags was deleted; `sleep_schedule` — a stretch of a sleep/wake
/// schedule in force; `commitment` — reservation and savings-plan discounts,
/// derived from billing; `manual` — logged by a person.
public enum SavingsEventKind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case rightsizing
    case orphanDeletion
    case sleepSchedule
    case commitment
    case manual
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "rightsizing": self = .rightsizing
        case "orphan_deletion": self = .orphanDeletion
        case "sleep_schedule": self = .sleepSchedule
        case "commitment": self = .commitment
        case "manual": self = .manual
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .rightsizing: return "rightsizing"
        case .orphanDeletion: return "orphan_deletion"
        case .sleepSchedule: return "sleep_schedule"
        case .commitment: return "commitment"
        case .manual: return "manual"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [SavingsEventKind] = [
        .rightsizing,
        .orphanDeletion,
        .sleepSchedule,
        .commitment,
        .manual,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
