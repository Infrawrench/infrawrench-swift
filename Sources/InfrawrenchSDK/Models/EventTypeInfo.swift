/*
 * InfrawrenchSDK v1.84.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.84.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct EventTypeInfo: Codable, Hashable, Sendable {
    public enum Category: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case cost
        case security
        case reliability
        case access
        case operations
        case system
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "cost": self = .cost
            case "security": self = .security
            case "reliability": self = .reliability
            case "access": self = .access
            case "operations": self = .operations
            case "system": self = .system
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .cost: return "cost"
            case .security: return "security"
            case .reliability: return "reliability"
            case .access: return "access"
            case .operations: return "operations"
            case .system: return "system"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Category] = [
            .cost,
            .security,
            .reliability,
            .access,
            .operations,
            .system,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var type: String
    public var version: Int
    public var label: String
    public var description: String
    public var category: Category
    public var defaultSeverity: EventSeverity
    /// Receiving it needs costs:read as well as org:settings:write.
    public var carriesCost: Bool
    /// JSON Schema of `data`.
    public var schema: [String: JSONValue]

    public init(
        type: String,
        version: Int,
        label: String,
        description: String,
        category: Category,
        defaultSeverity: EventSeverity,
        carriesCost: Bool,
        schema: [String: JSONValue]
    ) {
        self.type = type
        self.version = version
        self.label = label
        self.description = description
        self.category = category
        self.defaultSeverity = defaultSeverity
        self.carriesCost = carriesCost
        self.schema = schema
    }
}
