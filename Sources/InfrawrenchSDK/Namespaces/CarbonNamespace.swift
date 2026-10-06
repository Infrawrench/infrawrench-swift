/*
 * InfrawrenchSDK v1.75.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.75.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.carbon`
public final class CarbonNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Estimated operational carbon, with its assumptions
    ///
    /// An **estimate**, in the same sense the cost estimates here are, and built
    /// to be honest about that in three ways.
    ///
    /// **A resource that cannot be placed is never guessed.** No published figure
    /// for the provider, no entry for the region, no vCPU count: each produces an
    /// `unestimated` row with a stated reason and contributes nothing to the
    /// total. A carbon figure computed against a guessed grid is worse than no
    /// figure, because it is a number somebody will put in a report.
    ///
    /// **The assumptions travel with the answer**: utilisation, PUE, the
    /// coefficient source and its vintage are all on the response.
    ///
    /// **It covers processors and says so.** Virtual machines, Kubernetes nodes
    /// and sized managed services; storage, memory, network egress and embodied
    /// (manufacturing) emissions are excluded. Types with nothing to read (a
    /// bucket, a DNS record) are out of scope, not unestimated.
    ///
    /// What to read comes from each plugin's `carbon` declaration (or its
    /// `rightsizing` one): the region field, and vCPUs either directly or through
    /// the create form's size catalogue. Managed clusters whose nodes are listed
    /// in their own right are left out of the total, and a Kubernetes node that
    /// is also an instance is counted once (`duplicateCount`).
    ///
    /// Grid figures are Cloud Carbon Footprint's (Apache-2.0) for AWS, GCP and
    /// Azure, and Ember's 2024 country figures for every other provider; each row
    /// says which (`gridBasis`). They are not measured by us. One resource's
    /// monthly figure rides `POST /resources/cost-estimate` as `carbon`, beside
    /// its price.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/carbon
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter windowDays: Defaults to 30.
    public func get(
        orgId: String? = nil,
        windowDays: Int? = nil,
        options: RequestOptions? = nil
    ) async throws -> CarbonEstimate {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/carbon",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("windowDays", windowDays)]
            ),
            options: options
        )
    }
}
