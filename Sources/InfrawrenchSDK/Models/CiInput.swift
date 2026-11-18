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

public struct CiInput: Codable, Hashable, Sendable {
    public enum Type2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case string
        case boolean
        case choice
        case number
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "string": self = .string
            case "boolean": self = .boolean
            case "choice": self = .choice
            case "number": self = .number
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .string: return "string"
            case .boolean: return "boolean"
            case .choice: return "choice"
            case .number: return "number"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Type2] = [
            .string,
            .boolean,
            .choice,
            .number,
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
    public var type: Type2
    public var description: String?
    /// A run cannot start without a value; an empty one counts as none.
    public var `required`: Bool
    /// As text: `true` or `false` for a boolean, the number as written.
    public var `default`: String?
    /// A `choice` input's values.
    public var options: [String]?

    public init(
        name: String,
        type: Type2,
        description: String? = nil,
        `required`: Bool,
        `default`: String? = nil,
        options: [String]? = nil
    ) {
        self.name = name
        self.type = type
        self.description = description
        self.`required` = `required`
        self.`default` = `default`
        self.options = options
    }
}
