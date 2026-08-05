/*
 * InfrawrenchSDK v0.34.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.34.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DeployPlannedChange: Codable, Hashable, Sendable {
    public enum Action: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case create
        case update
        case delete
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "create": self = .create
            case "update": self = .update
            case "delete": self = .delete
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .create: return "create"
            case .update: return "update"
            case .delete: return "delete"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Action] = [
            .create,
            .update,
            .delete,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public struct Sidecar: Codable, Hashable, Sendable {
        public var pluginId: String
        public var parentResourceId: String

        public init(
            pluginId: String,
            parentResourceId: String
        ) {
            self.pluginId = pluginId
            self.parentResourceId = parentResourceId
        }
    }

    public var action: Action
    public var accountId: String
    public var resourceTypeId: String
    public var resourceId: String?
    public var displayName: String
    public var fields: [String: String]?
    public var sidecar: Sidecar?

    public init(
        action: Action,
        accountId: String,
        resourceTypeId: String,
        resourceId: String? = nil,
        displayName: String,
        fields: [String: String]? = nil,
        sidecar: Sidecar? = nil
    ) {
        self.action = action
        self.accountId = accountId
        self.resourceTypeId = resourceTypeId
        self.resourceId = resourceId
        self.displayName = displayName
        self.fields = fields
        self.sidecar = sidecar
    }
}
