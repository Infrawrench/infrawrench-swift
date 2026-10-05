/*
 * InfrawrenchSDK v1.56.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.56.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct FileGithubIssueInput: Codable, Hashable, Sendable {
    public struct Detail: Codable, Hashable, Sendable {
        /// The spec allows several shapes here. Decoding tries the branches in
        /// spec order, so the most specific match wins.
        public enum Value: Codable, Hashable, Sendable {
            case string(String)
            case double(Double)
            /// A shape none of the branches above matched.
            case other(JSONValue)

            public init(from decoder: any Decoder) throws {
                let container = try decoder.singleValueContainer()
                if let value = try? container.decode(String.self) {
                    self = .string(value)
                    return
                }
                if let value = try? container.decode(Double.self) {
                    self = .double(value)
                    return
                }
                self = .other(try container.decode(JSONValue.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                switch self {
                case .string(let value): try container.encode(value)
                case .double(let value): try container.encode(value)
                case .other(let value): try container.encode(value)
                }
            }
        }

        public var label: String
        public var value: Value?

        public init(
            label: String,
            value: Value? = nil
        ) {
            self.label = label
            self.value = value
        }
    }

    public struct MonthlyCost: Codable, Hashable, Sendable {
        public var amount: Double
        public var currency: String

        public init(
            amount: Double,
            currency: String
        ) {
            self.amount = amount
            self.currency = currency
        }
    }

    public var sourceKind: GithubIssueSourceKind
    public var sourceId: String
    public var title: String
    public var details: [Detail]?
    public var note: String?
    public var resourceId: String?
    public var monthlyCost: MonthlyCost?
    /// Shell commands that fix the finding, rendered as a code block to review.
    public var remediation: [String]?
    public var repo: GithubRepoRef?
    public var labels: [String]?
    public var assignees: [String]?
    public var appUrl: String?

    public init(
        sourceKind: GithubIssueSourceKind,
        sourceId: String,
        title: String,
        details: [Detail]? = nil,
        note: String? = nil,
        resourceId: String? = nil,
        monthlyCost: MonthlyCost? = nil,
        remediation: [String]? = nil,
        repo: GithubRepoRef? = nil,
        labels: [String]? = nil,
        assignees: [String]? = nil,
        appUrl: String? = nil
    ) {
        self.sourceKind = sourceKind
        self.sourceId = sourceId
        self.title = title
        self.details = details
        self.note = note
        self.resourceId = resourceId
        self.monthlyCost = monthlyCost
        self.remediation = remediation
        self.repo = repo
        self.labels = labels
        self.assignees = assignees
        self.appUrl = appUrl
    }
}
