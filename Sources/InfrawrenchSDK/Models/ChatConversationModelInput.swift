/*
 * InfrawrenchSDK v1.120.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.120.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ChatConversationModelInput: Codable, Hashable, Sendable {
    public enum Model: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case claudeSonnet55
        case claudeOpus55
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "claude-sonnet-5-5": self = .claudeSonnet55
            case "claude-opus-5-5": self = .claudeOpus55
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .claudeSonnet55: return "claude-sonnet-5-5"
            case .claudeOpus55: return "claude-opus-5-5"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Model] = [
            .claudeSonnet55,
            .claudeOpus55,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// The model the next turn runs on. Required.
    public var model: Model

    public init(
        model: Model
    ) {
        self.model = model
    }
}
