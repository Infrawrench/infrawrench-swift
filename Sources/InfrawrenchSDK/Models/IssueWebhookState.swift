/*
 * InfrawrenchSDK v1.82.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.82.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct IssueWebhookState: Codable, Hashable, Sendable {
    public enum Mode: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case registered
        case manual
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "registered": self = .registered
            case "manual": self = .manual
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .registered: return "registered"
            case .manual: return "manual"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Mode] = [
            .registered,
            .manual,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// `registered`: created in the tracker by Infrawrench. `manual`: created by
    /// a person with the URL and secret from here. Null: no webhook; statuses
    /// come from the poll.
    public var mode: Mode?
    /// The receiver URL the tracker posts to.
    public var url: String?
    /// When the last correctly signed delivery arrived.
    public var lastDeliveryAt: String?

    public init(
        mode: Mode? = nil,
        url: String? = nil,
        lastDeliveryAt: String? = nil
    ) {
        self.mode = mode
        self.url = url
        self.lastDeliveryAt = lastDeliveryAt
    }
}
