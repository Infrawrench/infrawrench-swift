/*
 * InfrawrenchSDK v1.20.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.20.0).
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
    /// Org resources that participate in at least one edge.
    public var nodes: [DependencyGraphNode]
    /// Directed depends-on edges (consumer → provider), deduped per consumer
    /// field and provider.
    public var edges: [DependencyGraphEdge]
    /// True when inference hit its edge cap and the returned graph is a partial
    /// view of the org.
    public var truncated: Bool

    public init(
        nodes: [DependencyGraphNode],
        edges: [DependencyGraphEdge],
        truncated: Bool
    ) {
        self.nodes = nodes
        self.edges = edges
        self.truncated = truncated
    }
}
