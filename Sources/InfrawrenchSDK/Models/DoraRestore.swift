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

public struct DoraRestore: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case incident
        case rollback
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "incident": self = .incident
            case "rollback": self = .rollback
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .incident: return "incident"
            case .rollback: return "rollback"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .incident,
            .rollback,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var kind: Kind
    public var id: String
    public var title: String
    public var startedAt: String
    public var restoredAt: String
    public var hours: Double
    public var changeId: String?

    public init(
        kind: Kind,
        id: String,
        title: String,
        startedAt: String,
        restoredAt: String,
        hours: Double,
        changeId: String? = nil
    ) {
        self.kind = kind
        self.id = id
        self.title = title
        self.startedAt = startedAt
        self.restoredAt = restoredAt
        self.hours = hours
        self.changeId = changeId
    }
}
