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

public struct AgentSession: Codable, Hashable, Sendable {
    public enum Tool: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case codex
        case claudeCode
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "codex": self = .codex
            case "claude-code": self = .claudeCode
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .codex: return "codex"
            case .claudeCode: return "claude-code"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Tool] = [
            .codex,
            .claudeCode,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case pending
        case provisioning
        case settingUp
        case up
        case failed
        case stopped
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "pending": self = .pending
            case "provisioning": self = .provisioning
            case "setting-up": self = .settingUp
            case "up": self = .up
            case "failed": self = .failed
            case "stopped": self = .stopped
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .pending: return "pending"
            case .provisioning: return "provisioning"
            case .settingUp: return "setting-up"
            case .up: return "up"
            case .failed: return "failed"
            case .stopped: return "stopped"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .pending,
            .provisioning,
            .settingUp,
            .up,
            .failed,
            .stopped,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var id: String
    public var repo: String
    public var projectName: String
    public var workspaceName: String
    public var accountId: String
    public var pluginId: String
    public var resourceTypeId: String
    public var tool: Tool
    public var branchName: String
    public var status: Status
    public var vmResourceId: String?
    public var logs: [String]
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        repo: String,
        projectName: String,
        workspaceName: String,
        accountId: String,
        pluginId: String,
        resourceTypeId: String,
        tool: Tool,
        branchName: String,
        status: Status,
        vmResourceId: String? = nil,
        logs: [String],
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.repo = repo
        self.projectName = projectName
        self.workspaceName = workspaceName
        self.accountId = accountId
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.tool = tool
        self.branchName = branchName
        self.status = status
        self.vmResourceId = vmResourceId
        self.logs = logs
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
