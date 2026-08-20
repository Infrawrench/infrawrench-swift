/*
 * InfrawrenchSDK v1.33.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.33.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CalendarSubscriptionCreate: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case changeFreeze
        case sleepSchedule
        case expiry
        case commitmentExpiry
        case workflowSchedule
        case incident
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "change-freeze": self = .changeFreeze
            case "sleep-schedule": self = .sleepSchedule
            case "expiry": self = .expiry
            case "commitment-expiry": self = .commitmentExpiry
            case "workflow-schedule": self = .workflowSchedule
            case "incident": self = .incident
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .changeFreeze: return "change-freeze"
            case .sleepSchedule: return "sleep-schedule"
            case .expiry: return "expiry"
            case .commitmentExpiry: return "commitment-expiry"
            case .workflowSchedule: return "workflow-schedule"
            case .incident: return "incident"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .changeFreeze,
            .sleepSchedule,
            .expiry,
            .commitmentExpiry,
            .workflowSchedule,
            .incident,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var name: String
    public var kinds: [Kind]?

    public init(
        name: String,
        kinds: [Kind]? = nil
    ) {
        self.name = name
        self.kinds = kinds
    }
}
