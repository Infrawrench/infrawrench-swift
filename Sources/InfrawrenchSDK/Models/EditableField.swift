/*
 * InfrawrenchSDK v0.14.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.14.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct EditableField: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case string
        case number
        case boolean
        case `enum`
        case secret
        case association
        case password
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "string": self = .string
            case "number": self = .number
            case "boolean": self = .boolean
            case "enum": self = .`enum`
            case "secret": self = .secret
            case "association": self = .association
            case "password": self = .password
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .string: return "string"
            case .number: return "number"
            case .boolean: return "boolean"
            case .`enum`: return "enum"
            case .secret: return "secret"
            case .association: return "association"
            case .password: return "password"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .string,
            .number,
            .boolean,
            .`enum`,
            .secret,
            .association,
            .password,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var key: String
    public var label: String
    public var kind: Kind
    public var `required`: Bool
    public var description: String?
    public var enumValues: [String]?

    public init(
        key: String,
        label: String,
        kind: Kind,
        `required`: Bool,
        description: String? = nil,
        enumValues: [String]? = nil
    ) {
        self.key = key
        self.label = label
        self.kind = kind
        self.`required` = `required`
        self.description = description
        self.enumValues = enumValues
    }
}
