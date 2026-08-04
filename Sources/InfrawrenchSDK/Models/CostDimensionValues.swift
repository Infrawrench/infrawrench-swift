/*
 * InfrawrenchSDK v0.31.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.31.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostDimensionValues: Codable, Hashable, Sendable {
    /// The spec allows several shapes here. Decoding tries the branches in spec
    /// order, so the most specific match wins.
    public enum Value: Codable, Hashable, Sendable {
        public struct ValueObject: Codable, Hashable, Sendable {
            public var value: String
            public var label: String

            public init(
                value: String,
                label: String
            ) {
                self.value = value
                self.label = label
            }
        }

        case string(String)
        case object(ValueObject)
        /// A shape none of the branches above matched.
        case other(JSONValue)

        public init(from decoder: any Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let value = try? container.decode(String.self) {
                self = .string(value)
                return
            }
            if let value = try? container.decode(ValueObject.self) {
                self = .object(value)
                return
            }
            self = .other(try container.decode(JSONValue.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .string(let value): try container.encode(value)
            case .object(let value): try container.encode(value)
            case .other(let value): try container.encode(value)
            }
        }
    }

    public var values: [Value]

    public init(
        values: [Value]
    ) {
        self.values = values
    }
}
