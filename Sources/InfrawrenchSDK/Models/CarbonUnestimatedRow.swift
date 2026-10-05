/*
 * InfrawrenchSDK v1.57.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.57.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CarbonUnestimatedRow: Codable, Hashable, Sendable {
    public enum Reason: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case unsupportedProvider
        case unknownRegion
        case unknownSize
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "unsupported-provider": self = .unsupportedProvider
            case "unknown-region": self = .unknownRegion
            case "unknown-size": self = .unknownSize
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .unsupportedProvider: return "unsupported-provider"
            case .unknownRegion: return "unknown-region"
            case .unknownSize: return "unknown-size"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Reason] = [
            .unsupportedProvider,
            .unknownRegion,
            .unknownSize,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var resourceId: String
    public var displayName: String
    public var pluginId: String
    public var resourceTypeId: String
    public var accountId: String
    public var accountName: String?
    public var region: String?
    /// Why a resource has no estimate. Reported per resource rather than folded
    /// into the total: a figure that quietly excluded a third of the estate would
    /// read as a complete answer.
    public var reason: Reason

    public init(
        resourceId: String,
        displayName: String,
        pluginId: String,
        resourceTypeId: String,
        accountId: String,
        accountName: String? = nil,
        region: String? = nil,
        reason: Reason
    ) {
        self.resourceId = resourceId
        self.displayName = displayName
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.accountId = accountId
        self.accountName = accountName
        self.region = region
        self.reason = reason
    }
}
