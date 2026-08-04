/*
 * InfrawrenchSDK v0.30.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.30.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SecretModifyRequest: Codable, Hashable, Sendable {
    public enum Action: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case enable
        case disable
        case destroy
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "enable": self = .enable
            case "disable": self = .disable
            case "destroy": self = .destroy
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .enable: return "enable"
            case .disable: return "disable"
            case .destroy: return "destroy"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Action] = [
            .enable,
            .disable,
            .destroy,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var accountId: String
    public var resourceId: ResourceId
    public var versionId: String
    public var action: Action
    public var parentResourceId: ResourceId?

    public init(
        accountId: String,
        resourceId: ResourceId,
        versionId: String,
        action: Action,
        parentResourceId: ResourceId? = nil
    ) {
        self.accountId = accountId
        self.resourceId = resourceId
        self.versionId = versionId
        self.action = action
        self.parentResourceId = parentResourceId
    }
}
