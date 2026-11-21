/*
 * InfrawrenchSDK v1.124.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.124.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct InfraenvDescribeResponse: Codable, Hashable, Sendable {
    /// Syntax problems, then references that point at nothing.
    public var problems: [InfraenvProblem]
    public var environments: [String]
    public var resources: [InfraenvResourceDescription]
    public var secrets: [InfraenvSecretDescription]

    public init(
        problems: [InfraenvProblem],
        environments: [String],
        resources: [InfraenvResourceDescription],
        secrets: [InfraenvSecretDescription]
    ) {
        self.problems = problems
        self.environments = environments
        self.resources = resources
        self.secrets = secrets
    }
}
