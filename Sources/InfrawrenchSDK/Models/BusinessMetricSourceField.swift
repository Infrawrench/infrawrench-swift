/*
 * InfrawrenchSDK v1.79.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.79.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BusinessMetricSourceField: Codable, Hashable, Sendable {
    public enum Type2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case select
        case sql
        case text
        case number
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "select": self = .select
            case "sql": self = .sql
            case "text": self = .text
            case "number": self = .number
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .select: return "select"
            case .sql: return "sql"
            case .text: return "text"
            case .number: return "number"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Type2] = [
            .select,
            .sql,
            .text,
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

    public struct Option: Codable, Hashable, Sendable {
        public var id: String
        public var label: String
        public var description: String?

        public init(
            id: String,
            label: String,
            description: String? = nil
        ) {
            self.id = id
            self.label = label
            self.description = description
        }
    }

    public var key: String
    public var label: String
    public var type: Type2
    public var `required`: Bool?
    public var description: String?
    public var placeholder: String?
    public var defaultValue: String?
    public var options: [Option]?
    public var dependsOn: [String]?
    public var allowCustom: Bool?

    public init(
        key: String,
        label: String,
        type: Type2,
        `required`: Bool? = nil,
        description: String? = nil,
        placeholder: String? = nil,
        defaultValue: String? = nil,
        options: [Option]? = nil,
        dependsOn: [String]? = nil,
        allowCustom: Bool? = nil
    ) {
        self.key = key
        self.label = label
        self.type = type
        self.`required` = `required`
        self.description = description
        self.placeholder = placeholder
        self.defaultValue = defaultValue
        self.options = options
        self.dependsOn = dependsOn
        self.allowCustom = allowCustom
    }
}
