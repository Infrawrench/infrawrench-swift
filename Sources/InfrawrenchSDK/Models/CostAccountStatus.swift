/*
 * InfrawrenchSDK v0.11.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.11.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostAccountStatus: Codable, Hashable, Sendable {
    public enum Dimension: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case service
        case region
        case resource
        case tag
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "service": self = .service
            case "region": self = .region
            case "resource": self = .resource
            case "tag": self = .tag
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .service: return "service"
            case .region: return "region"
            case .resource: return "resource"
            case .tag: return "tag"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Dimension] = [
            .service,
            .region,
            .resource,
            .tag,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public struct CostPollError: Codable, Hashable, Sendable {
        public struct HelpLink: Codable, Hashable, Sendable {
            public var label: String
            public var url: String

            public init(
                label: String,
                url: String
            ) {
                self.label = label
                self.url = url
            }
        }

        public var message: String
        public var helpLink: HelpLink?

        public init(
            message: String,
            helpLink: HelpLink? = nil
        ) {
            self.message = message
            self.helpLink = helpLink
        }
    }

    public struct Coverage: Codable, Hashable, Sendable {
        public var firstDay: String
        public var lastDay: String

        public init(
            firstDay: String,
            lastDay: String
        ) {
            self.firstDay = firstDay
            self.lastDay = lastDay
        }
    }

    public var accountId: String
    public var pluginId: String
    public var displayName: String
    public var supportsCosts: Bool
    public var periodNative: Bool
    public var dimensions: [Dimension]
    public var costLastPolledAt: String?
    public var costBackfilledAt: String?
    public var costPollFailureCount: Int
    /// Last cost-collection failure for this account, cleared on the next
    /// success. `helpLink` points at the provider page that fixes a setup problem
    /// when the plugin can identify one (e.g. GCP's billing export console).
    public var costPollError: CostPollError?
    public var coverage: Coverage?

    public init(
        accountId: String,
        pluginId: String,
        displayName: String,
        supportsCosts: Bool,
        periodNative: Bool,
        dimensions: [Dimension],
        costLastPolledAt: String? = nil,
        costBackfilledAt: String? = nil,
        costPollFailureCount: Int,
        costPollError: CostPollError? = nil,
        coverage: Coverage? = nil
    ) {
        self.accountId = accountId
        self.pluginId = pluginId
        self.displayName = displayName
        self.supportsCosts = supportsCosts
        self.periodNative = periodNative
        self.dimensions = dimensions
        self.costLastPolledAt = costLastPolledAt
        self.costBackfilledAt = costBackfilledAt
        self.costPollFailureCount = costPollFailureCount
        self.costPollError = costPollError
        self.coverage = coverage
    }
}
