/*
 * InfrawrenchSDK v1.30.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.30.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CalendarSubscription: Codable, Hashable, Sendable {
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

    public var id: String
    public var name: String
    /// Kinds the feed carries. Empty means every kind, including ones added
    /// later.
    public var kinds: [Kind]
    /// The subscription URL, returned **only** by the create call — the token it
    /// contains is stored hashed and cannot be shown again. Lose it and mint a
    /// new feed.
    public var url: String?
    public var createdAt: String
    /// Last fetch, written at most hourly. Its purpose is answering 'is anyone
    /// still using this?' before revoking, which an hour of staleness cannot
    /// change.
    public var lastAccessedAt: String?
    public var revokedAt: String?

    public init(
        id: String,
        name: String,
        kinds: [Kind],
        url: String? = nil,
        createdAt: String,
        lastAccessedAt: String? = nil,
        revokedAt: String? = nil
    ) {
        self.id = id
        self.name = name
        self.kinds = kinds
        self.url = url
        self.createdAt = createdAt
        self.lastAccessedAt = lastAccessedAt
        self.revokedAt = revokedAt
    }
}
