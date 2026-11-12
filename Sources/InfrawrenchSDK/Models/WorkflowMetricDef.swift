/*
 * InfrawrenchSDK v1.103.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.103.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct WorkflowMetricDef: Codable, Hashable, Sendable {
    public enum Type2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case number
        case string
        case boolean
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "number": self = .number
            case "string": self = .string
            case "boolean": self = .boolean
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .number: return "number"
            case .string: return "string"
            case .boolean: return "boolean"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Type2] = [
            .number,
            .string,
            .boolean,
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
    public var type: Type2
    public var unit: String?
    public var description: String?

    public init(
        key: String,
        label: String,
        type: Type2,
        unit: String? = nil,
        description: String? = nil
    ) {
        self.key = key
        self.label = label
        self.type = type
        self.unit = unit
        self.description = description
    }
}
