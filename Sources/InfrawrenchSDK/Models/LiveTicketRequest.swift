/*
 * InfrawrenchSDK v1.123.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.123.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct LiveTicketRequest: Codable, Hashable, Sendable {
    public enum Topic: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case jitRequests
        case accessRequests
        case workflowApprovals
        case changeFreezes
        case accountResources
        case resource
        case ciRuns
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "jit-requests": self = .jitRequests
            case "access-requests": self = .accessRequests
            case "workflow-approvals": self = .workflowApprovals
            case "change-freezes": self = .changeFreezes
            case "account-resources": self = .accountResources
            case "resource": self = .resource
            case "ci-runs": self = .ciRuns
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .jitRequests: return "jit-requests"
            case .accessRequests: return "access-requests"
            case .workflowApprovals: return "workflow-approvals"
            case .changeFreezes: return "change-freezes"
            case .accountResources: return "account-resources"
            case .resource: return "resource"
            case .ciRuns: return "ci-runs"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Topic] = [
            .jitRequests,
            .accessRequests,
            .workflowApprovals,
            .changeFreezes,
            .accountResources,
            .resource,
            .ciRuns,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// What to watch. `jit-requests` and `access-requests` need `access:read`,
    /// `workflow-approvals` `workflows:read`, `change-freezes` `freezes:read`,
    /// `account-resources` (with `accountId`) and `resource` (with `resourceId`)
    /// `resources:read`, and `ci-runs` `ci:read`.
    public var topic: Topic
    /// The account, for `account-resources`.
    public var accountId: String?
    /// The resource, for `resource`.
    public var resourceId: String?
    /// Narrow `workflow-approvals` to one workflow's pending approvals.
    public var workflowId: String?

    public init(
        topic: Topic,
        accountId: String? = nil,
        resourceId: String? = nil,
        workflowId: String? = nil
    ) {
        self.topic = topic
        self.accountId = accountId
        self.resourceId = resourceId
        self.workflowId = workflowId
    }
}
