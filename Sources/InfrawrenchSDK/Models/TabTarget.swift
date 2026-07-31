/*
 * InfrawrenchSDK v0.19.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.19.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct TabTarget: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case dashboard
        case account
        case resource
        case agents
        case costs
        case savings
        case workflows
        case deployments
        case chat
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "dashboard": self = .dashboard
            case "account": self = .account
            case "resource": self = .resource
            case "agents": self = .agents
            case "costs": self = .costs
            case "savings": self = .savings
            case "workflows": self = .workflows
            case "deployments": self = .deployments
            case "chat": self = .chat
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .dashboard: return "dashboard"
            case .account: return "account"
            case .resource: return "resource"
            case .agents: return "agents"
            case .costs: return "costs"
            case .savings: return "savings"
            case .workflows: return "workflows"
            case .deployments: return "deployments"
            case .chat: return "chat"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .dashboard,
            .account,
            .resource,
            .agents,
            .costs,
            .savings,
            .workflows,
            .deployments,
            .chat,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var kind: Kind
    public var dashboardId: String?
    public var accountId: String?
    public var resourceId: ResourceId?
    public var conversationId: String?

    public init(
        kind: Kind,
        dashboardId: String? = nil,
        accountId: String? = nil,
        resourceId: ResourceId? = nil,
        conversationId: String? = nil
    ) {
        self.kind = kind
        self.dashboardId = dashboardId
        self.accountId = accountId
        self.resourceId = resourceId
        self.conversationId = conversationId
    }
}
