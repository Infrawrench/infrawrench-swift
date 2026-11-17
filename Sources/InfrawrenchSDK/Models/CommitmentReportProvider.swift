/*
 * InfrawrenchSDK v1.117.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.117.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CommitmentReportProvider: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case measured
        case inventoryOnly
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "measured": self = .measured
            case "inventory_only": self = .inventoryOnly
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .measured: return "measured"
            case .inventoryOnly: return "inventory_only"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .measured,
            .inventoryOnly,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var pluginId: PluginId
    public var displayName: String
    /// `inventory_only`: the provider's holdings are collected but its cost rows
    /// do not distinguish covered usage (GCP today), so it is left out of every
    /// metric rather than read as 0% covered.
    public var status: Status
    public var accountCount: Int

    public init(
        pluginId: PluginId,
        displayName: String,
        status: Status,
        accountCount: Int
    ) {
        self.pluginId = pluginId
        self.displayName = displayName
        self.status = status
        self.accountCount = accountCount
    }
}
