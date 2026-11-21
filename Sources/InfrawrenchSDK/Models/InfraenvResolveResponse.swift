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

public struct InfraenvResolveResponse: Codable, Hashable, Sendable {
    public struct Value: Codable, Hashable, Sendable {
        public var key: String
        public var value: String

        public init(
            key: String,
            value: String
        ) {
            self.key = key
            self.value = value
        }
    }

    public var environment: String?
    public var values: [Value]
    /// Variables that did not resolve, with why. They are left out of `values`
    /// and `dotenv`.
    public var problems: [InfraenvProblem]
    /// The resolved `.env` text, starting with its auto-generated header.
    public var dotenv: String

    public init(
        environment: String? = nil,
        values: [Value],
        problems: [InfraenvProblem],
        dotenv: String
    ) {
        self.environment = environment
        self.values = values
        self.problems = problems
        self.dotenv = dotenv
    }
}
