/*
 * InfrawrenchSDK v1.31.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.31.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct OrgConfigChange: Codable, Hashable, Sendable {
    public enum Action: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case create
        case update
        case delete
        case unchanged
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "create": self = .create
            case "update": self = .update
            case "delete": self = .delete
            case "unchanged": self = .unchanged
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .create: return "create"
            case .update: return "update"
            case .delete: return "delete"
            case .unchanged: return "unchanged"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Action] = [
            .create,
            .update,
            .delete,
            .unchanged,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var section: OrgConfigSection
    public var key: String
    public var name: String
    public var action: Action
    /// Fields that differ, on an update.
    public var fields: [String]?

    public init(
        section: OrgConfigSection,
        key: String,
        name: String,
        action: Action,
        fields: [String]? = nil
    ) {
        self.section = section
        self.key = key
        self.name = name
        self.action = action
        self.fields = fields
    }
}
