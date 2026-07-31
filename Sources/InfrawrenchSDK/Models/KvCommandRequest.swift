/*
 * InfrawrenchSDK v0.26.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.26.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct KvCommandRequest: Codable, Hashable, Sendable {
    /// The spec allows several shapes here. Decoding tries the branches in spec
    /// order, so the most specific match wins.
    public enum Arg: Codable, Hashable, Sendable {
        case string(String)
        case double(Double)
        /// A shape none of the branches above matched.
        case other(JSONValue)

        public init(from decoder: any Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let value = try? container.decode(String.self) {
                self = .string(value)
                return
            }
            if let value = try? container.decode(Double.self) {
                self = .double(value)
                return
            }
            self = .other(try container.decode(JSONValue.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .string(let value): try container.encode(value)
            case .double(let value): try container.encode(value)
            case .other(let value): try container.encode(value)
            }
        }
    }

    public var accountId: String
    public var command: String
    public var args: [Arg]
    public var pluginId: String?
    public var parentResourceId: ResourceId?

    public init(
        accountId: String,
        command: String,
        args: [Arg],
        pluginId: String? = nil,
        parentResourceId: ResourceId? = nil
    ) {
        self.accountId = accountId
        self.command = command
        self.args = args
        self.pluginId = pluginId
        self.parentResourceId = parentResourceId
    }
}
