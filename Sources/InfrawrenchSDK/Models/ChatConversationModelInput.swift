/*
 * InfrawrenchSDK v1.108.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.108.0).
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
        case gemini37Flash
        case claudeSonnet5
        case claudeOpus5
        case claudeHaiku45
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "gemini-3.7-flash": self = .gemini37Flash
            case "claude-sonnet-5": self = .claudeSonnet5
            case "claude-opus-5": self = .claudeOpus5
            case "claude-haiku-4-5": self = .claudeHaiku45
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .gemini37Flash: return "gemini-3.7-flash"
            case .claudeSonnet5: return "claude-sonnet-5"
            case .claudeOpus5: return "claude-opus-5"
            case .claudeHaiku45: return "claude-haiku-4-5"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Model] = [
            .gemini37Flash,
            .claudeSonnet5,
            .claudeOpus5,
            .claudeHaiku45,
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
