/*
 * InfrawrenchSDK v0.32.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.32.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ChangeFreezeBlocked: Codable, Hashable, Sendable {
    public enum Code: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case changeFreezeActive
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "change_freeze_active": self = .changeFreezeActive
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .changeFreezeActive: return "change_freeze_active"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Code] = [
            .changeFreezeActive,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public struct Freeze: Codable, Hashable, Sendable {
        public var id: String
        public var name: String
        public var reason: String?
        public var startsAt: String
        public var endsAt: String?

        public init(
            id: String,
            name: String,
            reason: String? = nil,
            startsAt: String,
            endsAt: String? = nil
        ) {
            self.id = id
            self.name = name
            self.reason = reason
            self.startsAt = startsAt
            self.endsAt = endsAt
        }
    }

    public var error: String
    public var code: Code
    public var freeze: Freeze

    public init(
        error: String,
        code: Code,
        freeze: Freeze
    ) {
        self.error = error
        self.code = code
        self.freeze = freeze
    }
}
