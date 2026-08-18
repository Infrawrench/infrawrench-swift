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

public struct EnvironmentParameter: Codable, Hashable, Sendable {
    public enum Type2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case string
        case number
        case select
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "string": self = .string
            case "number": self = .number
            case "select": self = .select
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .string: return "string"
            case .number: return "number"
            case .select: return "select"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Type2] = [
            .string,
            .number,
            .select,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public struct Option: Codable, Hashable, Sendable {
        public var id: String
        public var label: String

        public init(
            id: String,
            label: String
        ) {
            self.id = id
            self.label = label
        }
    }

    public var key: String
    public var label: String
    public var type: Type2
    public var `required`: Bool
    public var defaultValue: String?
    public var options: [Option]?
    public var description: String?

    public init(
        key: String,
        label: String,
        type: Type2,
        `required`: Bool,
        defaultValue: String? = nil,
        options: [Option]? = nil,
        description: String? = nil
    ) {
        self.key = key
        self.label = label
        self.type = type
        self.`required` = `required`
        self.defaultValue = defaultValue
        self.options = options
        self.description = description
    }
}
