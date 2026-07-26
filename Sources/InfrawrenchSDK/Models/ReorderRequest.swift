/*
 * InfrawrenchSDK v0.1.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.1.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ReorderRequest: Codable, Hashable, Sendable {
    public struct Card: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case resource
            case workflow
            case widget
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "resource": self = .resource
                case "workflow": self = .workflow
                case "widget": self = .widget
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .resource: return "resource"
                case .workflow: return "workflow"
                case .widget: return "widget"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .resource,
                .workflow,
                .widget,
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

        public init(
            kind: Kind,
            id: String
        ) {
            self.kind = kind
            self.id = id
        }
    }

    public var cards: [Card]?
    public var resourceIds: [ResourceId]?

    public init(
        cards: [Card]? = nil,
        resourceIds: [ResourceId]? = nil
    ) {
        self.cards = cards
        self.resourceIds = resourceIds
    }
}
