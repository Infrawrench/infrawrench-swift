/*
 * InfrawrenchSDK v1.77.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.77.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// The scheduled importer feeding this metric, or null when its values are only
/// pushed.
///
/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct BusinessMetricImporterSummary: Codable, Hashable, Sendable {
    public enum LastStatus: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case success
        case error
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "success": self = .success
            case "error": self = .error
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .success: return "success"
            case .error: return "error"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [LastStatus] = [
            .success,
            .error,
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
    public var accountName: String?
    public var pluginId: String?
    /// The source plugin's name for itself, e.g. "CloudWatch metric".
    public var sourceLabel: String?
    public var enabled: Bool
    public var lastRunAt: String?
    public var lastStatus: LastStatus?
    public var lastError: String?

    public init(
        accountId: String,
        accountName: String? = nil,
        pluginId: String? = nil,
        sourceLabel: String? = nil,
        enabled: Bool,
        lastRunAt: String? = nil,
        lastStatus: LastStatus? = nil,
        lastError: String? = nil
    ) {
        self.accountId = accountId
        self.accountName = accountName
        self.pluginId = pluginId
        self.sourceLabel = sourceLabel
        self.enabled = enabled
        self.lastRunAt = lastRunAt
        self.lastStatus = lastStatus
        self.lastError = lastError
    }
}
