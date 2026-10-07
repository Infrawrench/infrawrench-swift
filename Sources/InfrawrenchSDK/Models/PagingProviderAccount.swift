/*
 * InfrawrenchSDK v1.76.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.76.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PagingProviderAccount: Codable, Hashable, Sendable {
    public struct Incidents: Codable, Hashable, Sendable {
        public var label: String
        public var canAcknowledge: Bool
        public var canResolve: Bool

        public init(
            label: String,
            canAcknowledge: Bool,
            canResolve: Bool
        ) {
            self.label = label
            self.canAcknowledge = canAcknowledge
            self.canResolve = canResolve
        }
    }

    public enum WebhookMode: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case managed
        case manual
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "managed": self = .managed
            case "manual": self = .manual
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .managed: return "managed"
            case .manual: return "manual"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [WebhookMode] = [
            .managed,
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

    public var accountId: String
    public var displayName: String
    public var pluginId: String
    public var targetLabel: String
    public var targetDescription: String?
    /// Whether an Infrawrench acknowledgement is written back as an event.
    public var supportsAcknowledgeEvent: Bool
    public var onCallSourceLabel: String?
    public var incidents: Incidents?
    /// `managed`: Infrawrench subscribes the webhook through the provider's API.
    /// `manual`: the user adds the URL in the provider's dashboard and pastes its
    /// signing secret.
    public var webhookMode: WebhookMode?
    public var webhookSetupHelp: String?
    public var settings: PagingProviderSettings

    public init(
        accountId: String,
        displayName: String,
        pluginId: String,
        targetLabel: String,
        targetDescription: String? = nil,
        supportsAcknowledgeEvent: Bool,
        onCallSourceLabel: String? = nil,
        incidents: Incidents? = nil,
        webhookMode: WebhookMode? = nil,
        webhookSetupHelp: String? = nil,
        settings: PagingProviderSettings
    ) {
        self.accountId = accountId
        self.displayName = displayName
        self.pluginId = pluginId
        self.targetLabel = targetLabel
        self.targetDescription = targetDescription
        self.supportsAcknowledgeEvent = supportsAcknowledgeEvent
        self.onCallSourceLabel = onCallSourceLabel
        self.incidents = incidents
        self.webhookMode = webhookMode
        self.webhookSetupHelp = webhookSetupHelp
        self.settings = settings
    }
}
