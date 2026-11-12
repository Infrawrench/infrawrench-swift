/*
 * InfrawrenchSDK v1.105.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.105.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CiAccountsUpdateBody: Codable, Hashable, Sendable {
    public var enabled: Bool

    public init(
        enabled: Bool
    ) {
        self.enabled = enabled
    }
}

public struct CiRunsGetResult: Codable, Hashable, Sendable {
    public var runs: [CiRun]

    public init(
        runs: [CiRun]
    ) {
        self.runs = runs
    }
}

public struct CiRunsRetryBody: Codable, Hashable, Sendable {
    /// Run every `task-cache:` job instead of replaying a passing run's result.
    /// Results are saved again either way.
    public var noTaskCache: Bool?

    public init(
        noTaskCache: Bool? = nil
    ) {
        self.noTaskCache = noTaskCache
    }
}

public struct CiValuesUpdateBody: Codable, Hashable, Sendable {
    public var value: String

    public init(
        value: String
    ) {
        self.value = value
    }
}

/// `client.ci`
public final class CiNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.ci.accounts`
    public let accounts: CiAccountsNamespace
    /// `client.ci.caches`
    public let caches: CiCachesNamespace
    /// `client.ci.runs`
    public let runs: CiRunsNamespace
    /// `client.ci.values`
    public let values: CiValuesNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.accounts = CiAccountsNamespace(transport: transport)
        self.caches = CiCachesNamespace(transport: transport)
        self.runs = CiRunsNamespace(transport: transport)
        self.values = CiValuesNamespace(transport: transport)
    }

    /// CI status and the GitHub accounts that run it
    ///
    /// _Requires permission: `ci:read`._
    ///
    /// GET /api/org/{orgId}/ci
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CiStatus {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/ci",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// CI usage in a month: runs, compute and storage (caches and downloads)
    ///
    /// _Requires permission: `ci:read`._
    ///
    /// GET /api/org/{orgId}/ci/usage
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func usage(
        orgId: String? = nil,
        month: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CiUsage {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/ci/usage",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("month", month)]
            ),
            options: options
        )
    }
}

/// `client.ci.accounts`
public final class CiAccountsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Run CI, or stop running it, for a connected GitHub account
    ///
    /// _Requires permission: `ci:write`._
    ///
    /// PUT /api/org/{orgId}/ci/accounts/{installationId}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        installationId: String,
        body: CiAccountsUpdateBody,
        options: RequestOptions? = nil
    ) async throws -> CiAccount {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/ci/accounts/{installationId}",
                pathParameters: ["orgId": orgId?.parameterValue, "installationId": installationId.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}

/// `client.ci.caches`
public final class CiCachesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Clear a repository's CI caches
    ///
    /// Deletes every branch's and pull request's `cache:` and `task-cache:`
    /// entries of one repository. The next run of each job starts cold and saves
    /// again.
    ///
    /// _Requires permission: `ci:write`._
    ///
    /// DELETE /api/org/{orgId}/ci/caches/{installationId}/{repo}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        installationId: String,
        repo: String,
        options: RequestOptions? = nil
    ) async throws -> CiCacheCleared {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/ci/caches/{installationId}/{repo}",
                pathParameters: ["orgId": orgId?.parameterValue, "installationId": installationId.parameterValue, "repo": repo.parameterValue]
            ),
            options: options
        )
    }

    /// The caches CI keeps for each repository
    ///
    /// _Requires permission: `ci:read`._
    ///
    /// GET /api/org/{orgId}/ci/caches
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CiCaches {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/ci/caches",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.ci.runs`
public final class CiRunsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Approve a fork's pull request commit
    ///
    /// Runs CI for this one commit of a pull request from a fork, without the
    /// organization's or repository's secrets. A later commit needs approving
    /// again.
    ///
    /// _Requires permission: `ci:approve`._
    ///
    /// POST /api/org/{orgId}/ci/runs/{runId}/approve
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func approve(
        orgId: String? = nil,
        runId: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/ci/runs/{runId}/approve",
                pathParameters: ["orgId": orgId?.parameterValue, "runId": runId.parameterValue]
            ),
            options: options
        )
    }

    /// Cancel a CI run
    ///
    /// A queued run, or one waiting for its concurrency group, ends as cancelled
    /// at once. A running one is stopped by its runner, its running jobs as a
    /// timeout would stop them, and ends as cancelled once the runner reports it.
    /// A run waiting for approval is rejected instead.
    ///
    /// _Requires permission: `ci:approve`._
    ///
    /// POST /api/org/{orgId}/ci/runs/{runId}/cancel
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func cancel(
        orgId: String? = nil,
        runId: String,
        options: RequestOptions? = nil
    ) async throws -> CiRun {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/ci/runs/{runId}/cancel",
                pathParameters: ["orgId": orgId?.parameterValue, "runId": runId.parameterValue]
            ),
            options: options
        )
    }

    /// A short-lived link to a file a job kept for download
    ///
    /// The link is signed for this one file for 15 minutes (less when the file
    /// expires sooner) and is served by the CI proxy, not this API.
    ///
    /// _Requires permission: `ci:read`._
    ///
    /// GET /api/org/{orgId}/ci/runs/{runId}/download
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter job: The job's id, as the run's `jobs` list it.
    ///
    /// - Parameter path: The file's `path`, as the job's `downloads` list it.
    public func download(
        orgId: String? = nil,
        runId: String,
        job: String,
        path: String,
        options: RequestOptions? = nil
    ) async throws -> CiDownloadLink {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/ci/runs/{runId}/download",
                pathParameters: ["orgId": orgId?.parameterValue, "runId": runId.parameterValue],
                query: [QueryParameter("job", job), QueryParameter("path", path)]
            ),
            options: options
        )
    }

    /// List CI runs, newest first
    ///
    /// _Requires permission: `ci:read`._
    ///
    /// GET /api/org/{orgId}/ci/runs
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        status: CiRunStatus? = nil,
        limit: Int? = nil,
        options: RequestOptions? = nil
    ) async throws -> CiRunsGetResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/ci/runs",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("status", status), QueryParameter("limit", limit)]
            ),
            options: options
        )
    }

    /// A CI run, with each job's output once it has finished
    ///
    /// _Requires permission: `ci:read`._
    ///
    /// GET /api/org/{orgId}/ci/runs/{runId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func getOrgOrgIdCiRunsRunId(
        orgId: String? = nil,
        runId: String,
        options: RequestOptions? = nil
    ) async throws -> CiRunDetail {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/ci/runs/{runId}",
                pathParameters: ["orgId": orgId?.parameterValue, "runId": runId.parameterValue]
            ),
            options: options
        )
    }

    /// Decline to run a fork's pull request commit
    ///
    /// _Requires permission: `ci:approve`._
    ///
    /// POST /api/org/{orgId}/ci/runs/{runId}/reject
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func reject(
        orgId: String? = nil,
        runId: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/ci/runs/{runId}/reject",
                pathParameters: ["orgId": orgId?.parameterValue, "runId": runId.parameterValue]
            ),
            options: options
        )
    }

    /// Run a finished CI run again
    ///
    /// Queues a new run of the same repository, commit, branch and event, linked
    /// to this one. A run waiting for approval is approved instead, and a fork's
    /// pull request still runs without secrets.
    ///
    /// _Requires permission: `ci:approve`._
    ///
    /// POST /api/org/{orgId}/ci/runs/{runId}/retry
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func retry(
        orgId: String? = nil,
        runId: String,
        body: CiRunsRetryBody,
        options: RequestOptions? = nil
    ) async throws -> CiRun {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/ci/runs/{runId}/retry",
                pathParameters: ["orgId": orgId?.parameterValue, "runId": runId.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}

/// `client.ci.values`
public final class CiValuesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Remove a CI secret or variable
    ///
    /// _Requires permission: `ci:write`._
    ///
    /// DELETE /api/org/{orgId}/ci/values/{kind}/{name}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter kind: One of `secrets`, `variables`.
    ///
    /// - Parameter installationId: The GitHub App installation of an account that
    /// runs CI.
    ///
    /// - Parameter repo: A repository's name, for its own values. Omitted: the
    /// whole account's.
    public func delete(
        orgId: String? = nil,
        kind: String,
        name: String,
        installationId: Int,
        repo: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/ci/values/{kind}/{name}",
                pathParameters: ["orgId": orgId?.parameterValue, "kind": kind.parameterValue, "name": name.parameterValue],
                query: [QueryParameter("installationId", installationId), QueryParameter("repo", repo)]
            ),
            options: options
        )
    }

    /// List an account's or a repository's CI secrets and variables
    ///
    /// A repository's own value overrides the account's of the same name.
    /// Pipelines read them as `${{ secrets.NAME }}` and `${{ vars.NAME }}`; a
    /// fork's pull request gets variables but never secrets.
    ///
    /// _Requires permission: `ci:write`._
    ///
    /// GET /api/org/{orgId}/ci/values
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter installationId: The GitHub App installation of an account that
    /// runs CI.
    ///
    /// - Parameter repo: A repository's name, for its own values. Omitted: the
    /// whole account's.
    public func get(
        orgId: String? = nil,
        installationId: Int,
        repo: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CiValues {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/ci/values",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("installationId", installationId), QueryParameter("repo", repo)]
            ),
            options: options
        )
    }

    /// Set a CI secret or variable
    ///
    /// _Requires permission: `ci:write`._
    ///
    /// PUT /api/org/{orgId}/ci/values/{kind}/{name}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter kind: One of `secrets`, `variables`.
    ///
    /// - Parameter installationId: The GitHub App installation of an account that
    /// runs CI.
    ///
    /// - Parameter repo: A repository's name, for its own values. Omitted: the
    /// whole account's.
    public func update(
        orgId: String? = nil,
        kind: String,
        name: String,
        installationId: Int,
        repo: String? = nil,
        body: CiValuesUpdateBody,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/ci/values/{kind}/{name}",
                pathParameters: ["orgId": orgId?.parameterValue, "kind": kind.parameterValue, "name": name.parameterValue],
                query: [QueryParameter("installationId", installationId), QueryParameter("repo", repo)],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
