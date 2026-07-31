/*
 * InfrawrenchSDK v0.25.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.25.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DependencyGraphResponse: Codable, Hashable, Sendable {
    /// Org resources that participate in at least one output reference.
    public var nodes: [DependencyGraphNode]
    /// Directed depends-on edges (consumer → provider), deduped per consumer
    /// field.
    public var edges: [DependencyGraphEdge]

    public init(
        nodes: [DependencyGraphNode],
        edges: [DependencyGraphEdge]
    ) {
        self.nodes = nodes
        self.edges = edges
    }
}
