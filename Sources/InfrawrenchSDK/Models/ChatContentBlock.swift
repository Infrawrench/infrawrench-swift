/*
 * InfrawrenchSDK v1.105.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.105.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// The spec allows several shapes here. Decoding tries the branches in spec
/// order, so the most specific match wins.
public enum ChatContentBlock: Codable, Hashable, Sendable {
    public struct ChatContentBlockObject: Codable, Hashable, Sendable {
        public enum Type2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case text
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "text": self = .text
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .text: return "text"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Type2] = [
                .text,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public enum Provider: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case anthropic
            case gemini
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "anthropic": self = .anthropic
                case "gemini": self = .gemini
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .anthropic: return "anthropic"
                case .gemini: return "gemini"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Provider] = [
                .anthropic,
                .gemini,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var type: Type2
        public var text: String
        public var signature: String?
        /// Which provider minted the block's signature; absent on blocks written
        /// before the field, which are Anthropic's.
        public var provider: Provider?

        public init(
            type: Type2,
            text: String,
            signature: String? = nil,
            provider: Provider? = nil
        ) {
            self.type = type
            self.text = text
            self.signature = signature
            self.provider = provider
        }
    }

    public struct ChatContentBlockObject2: Codable, Hashable, Sendable {
        public enum Type2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case thinking
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "thinking": self = .thinking
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .thinking: return "thinking"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Type2] = [
                .thinking,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public enum Provider: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case anthropic
            case gemini
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "anthropic": self = .anthropic
                case "gemini": self = .gemini
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .anthropic: return "anthropic"
                case .gemini: return "gemini"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Provider] = [
                .anthropic,
                .gemini,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var type: Type2
        public var thinking: String
        public var signature: String
        /// Which provider minted the block's signature; absent on blocks written
        /// before the field, which are Anthropic's.
        public var provider: Provider?

        public init(
            type: Type2,
            thinking: String,
            signature: String,
            provider: Provider? = nil
        ) {
            self.type = type
            self.thinking = thinking
            self.signature = signature
            self.provider = provider
        }
    }

    public struct ChatContentBlockObject3: Codable, Hashable, Sendable {
        public enum Type2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case toolUse
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "tool_use": self = .toolUse
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .toolUse: return "tool_use"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Type2] = [
                .toolUse,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public enum Provider: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case anthropic
            case gemini
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "anthropic": self = .anthropic
                case "gemini": self = .gemini
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .anthropic: return "anthropic"
                case .gemini: return "gemini"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Provider] = [
                .anthropic,
                .gemini,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var type: Type2
        public var id: String
        public var name: String
        public var input: JSONValue
        public var signature: String?
        /// Which provider minted the block's signature; absent on blocks written
        /// before the field, which are Anthropic's.
        public var provider: Provider?

        public init(
            type: Type2,
            id: String,
            name: String,
            input: JSONValue,
            signature: String? = nil,
            provider: Provider? = nil
        ) {
            self.type = type
            self.id = id
            self.name = name
            self.input = input
            self.signature = signature
            self.provider = provider
        }
    }

    public struct ChatContentBlockObject4: Codable, Hashable, Sendable {
        public enum Type2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case toolResult
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "tool_result": self = .toolResult
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .toolResult: return "tool_result"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Type2] = [
                .toolResult,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        /// The spec allows several shapes here. Decoding tries the branches in
        /// spec order, so the most specific match wins.
        public enum Content: Codable, Hashable, Sendable {
            public struct ContentArray: Codable, Hashable, Sendable {
                public enum Type3: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
                    case text
                    /// A value the API added after this SDK was generated. Kept
                    /// rather than rejected, so a new server-side value cannot
                    /// break decoding.
                    case unrecognized(String)

                    public init(rawValue: String) {
                        switch rawValue {
                        case "text": self = .text
                        default: self = .unrecognized(rawValue)
                        }
                    }

                    public var rawValue: String {
                        switch self {
                        case .text: return "text"
                        case .unrecognized(let value): return value
                        }
                    }

                    /// Every value the spec declares. `unrecognized` is deliberately absent.
                    public static let allKnownCases: [Type3] = [
                        .text,
                    ]

                    public init(from decoder: any Decoder) throws {
                        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
                    }

                    public func encode(to encoder: any Encoder) throws {
                        var container = encoder.singleValueContainer()
                        try container.encode(rawValue)
                    }
                }

                public var type: Type3
                public var text: String

                public init(
                    type: Type3,
                    text: String
                ) {
                    self.type = type
                    self.text = text
                }
            }

            case string(String)
            case array([ContentArray])
            /// A shape none of the branches above matched.
            case other(JSONValue)

            public init(from decoder: any Decoder) throws {
                let container = try decoder.singleValueContainer()
                if let value = try? container.decode(String.self) {
                    self = .string(value)
                    return
                }
                if let value = try? container.decode([ContentArray].self) {
                    self = .array(value)
                    return
                }
                self = .other(try container.decode(JSONValue.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                switch self {
                case .string(let value): try container.encode(value)
                case .array(let value): try container.encode(value)
                case .other(let value): try container.encode(value)
                }
            }
        }

        public var type: Type2
        public var tool_use_id: String
        public var content: Content
        public var is_error: Bool?

        public init(
            type: Type2,
            tool_use_id: String,
            content: Content,
            is_error: Bool? = nil
        ) {
            self.type = type
            self.tool_use_id = tool_use_id
            self.content = content
            self.is_error = is_error
        }
    }

    case object(ChatContentBlockObject)
    case object2(ChatContentBlockObject2)
    case object3(ChatContentBlockObject3)
    case object4(ChatContentBlockObject4)
    /// A shape none of the branches above matched.
    case other(JSONValue)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(ChatContentBlockObject.self) {
            self = .object(value)
            return
        }
        if let value = try? container.decode(ChatContentBlockObject2.self) {
            self = .object2(value)
            return
        }
        if let value = try? container.decode(ChatContentBlockObject3.self) {
            self = .object3(value)
            return
        }
        if let value = try? container.decode(ChatContentBlockObject4.self) {
            self = .object4(value)
            return
        }
        self = .other(try container.decode(JSONValue.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .object(let value): try container.encode(value)
        case .object2(let value): try container.encode(value)
        case .object3(let value): try container.encode(value)
        case .object4(let value): try container.encode(value)
        case .other(let value): try container.encode(value)
        }
    }
}
