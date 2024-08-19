local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-che') {
  settings+: {
    blog: "http://www.eclipse.org/che",
    description: "Eclipse Che® is a platform for providing Kubernetes-based Cloud Development Environments for Enterprise Teams. Learn more at http://www.eclipse.org/che",
    web_commit_signoff_required: false,
    workflows+: {
      default_workflow_permissions: "write",
    },
  },
  secrets+: [
    orgs.newOrgSecret('CODECOV_TOKEN') {
      value: "********",
    },
  ],
  _repositories+:: [
    orgs.newRepo('.github') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('blog') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "javascript",
        "javascript-typescript",
        "ruby",
        "typescript"
      ],
      code_scanning_default_setup_enabled: true,
      description: "Eclipse Che Blog",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      homepage: "https://che.eclipseprojects.io",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('CHE_BOT_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKERHUB_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKERHUB_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('SURGE_TOKEN') {
          value: "********",
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('che') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "javascript",
        "javascript-typescript",
        "typescript"
      ],
      code_scanning_default_setup_enabled: true,
      dependabot_security_updates_enabled: true,
      description: "Kubernetes based Cloud Development Environments for Enterprise Teams",
      homepage: "http://eclipse.org/che",
      topics+: [
        "cloud",
        "cloud-ide",
        "containers",
        "devtools",
        "eclipse",
        "ide",
        "kubernetes"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://hooks.slack.com/services/T02G3VAG4/B03N75S9B/*') {
          content_type: "json",
          events+: [
            "push"
          ],
        },
        orgs.newRepoWebhook('https://ci.appveyor.com/api/github/webhook?id=ro78pmwomlklkwbo') {
          content_type: "json",
          events+: [
            "push"
          ],
        },
        orgs.newRepoWebhook('https://hooks.slack.com/services/T02G3VAG4/B0BLA7BJP/*') {
          content_type: "json",
          events+: [
            "issue_comment",
            "issues",
            "pull_request",
            "pull_request_review_comment"
          ],
        },
        orgs.newRepoWebhook('https://ci.centos.org/github-webhook/') {
          events+: [
            "push"
          ],
        },
        orgs.newRepoWebhook('https://ci.centos.org/ghprbhook/') {
          events+: [
            "issue_comment",
            "pull_request",
            "push"
          ],
        },
        orgs.newRepoWebhook('https://ci.codenvycorp.com/github-webhook/') {
          events+: [
            "push"
          ],
        },
        orgs.newRepoWebhook('https://ci.codenvycorp.com/ghprbhook/') {
          events+: [
            "issue_comment",
            "pull_request",
            "push"
          ],
        },
        orgs.newRepoWebhook('https://smee.io/pRtJXvHGV9e8Zth') {
          content_type: "json",
          events+: [
            "issue_comment",
            "pull_request",
            "push"
          ],
        },
        orgs.newRepoWebhook('https://hook-ci.apps.ci.l2s4.p1.openshiftapps.com/hook') {
          content_type: "json",
          events+: [
            "*"
          ],
          secret: "********",
        },
      ],
      secrets: [
        orgs.newRepoSecret('CHE_BOT_GITHUB_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('CHE_GITHUB_SSH_KEY') {
          value: "********",
        },
        orgs.newRepoSecret('CHE_MAVEN_SETTINGS') {
          value: "********",
        },
        orgs.newRepoSecret('CHE_NPM_AUTH_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('CHE_OSS_SONATYPE_GPG_KEY') {
          value: "********",
        },
        orgs.newRepoSecret('CHE_OSS_SONATYPE_PASSPHRASE') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKERHUB_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKERHUB_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('MATTERMOST_WEBHOOK_URL') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('SONARCLOUD_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('SONAR_TOKEN') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
        },
        orgs.newBranchProtectionRule('assets') {
          required_approving_review_count: null,
          requires_pull_request: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('che-archetypes') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('che-dashboard') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "javascript",
        "javascript-typescript",
        "typescript"
      ],
      code_scanning_default_setup_enabled: true,
      dependabot_security_updates_enabled: true,
      has_issues: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://ci.centos.org/github-webhook/') {
          events+: [
            "create",
            "delete",
            "pull_request",
            "push"
          ],
        },
        orgs.newRepoWebhook('https://smee.io/pRtJXvHGV9e8Zth') {
          content_type: "json",
          events+: [
            "issue_comment",
            "pull_request",
            "push"
          ],
        },
      ],
      secrets: [
        orgs.newRepoSecret('CHE_BOT_GITHUB_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKERHUB_MAXURA_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKERHUB_MAXURA_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKERHUB_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKERHUB_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('MATTERMOST_WEBHOOK_URL') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_USERNAME') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: null,
          required_status_checks+: [
            "any:WIP",
            "build-and-test (20.x)"
          ],
          requires_pull_request: false,
        },
      ],
    },
    orgs.newRepo('che-dependencies') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Che Dependencies",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('che-dev') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      description: "Development resources and tools for Eclipse Che.",
      homepage: "",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://ci.codenvycorp.com/ghprbhook/') {
          events+: [
            "issue_comment",
            "pull_request",
            "push"
          ],
        },
        orgs.newRepoWebhook('https://ci.codenvycorp.com/github-webhook/') {
          events+: [
            "push"
          ],
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('che-devfile-registry') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      code_scanning_default_setup_enabled: true,
      dependabot_security_updates_enabled: true,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://ci.centos.org/github-webhook/') {
          events+: [
            "push"
          ],
        },
        orgs.newRepoWebhook('https://ci.centos.org/ghprbhook/') {
          events+: [
            "issue_comment",
            "pull_request",
            "push"
          ],
        },
      ],
      secrets: [
        orgs.newRepoSecret('CHE_BOT_GITHUB_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('CRW_BUILD_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('CRW_BUILD_USER') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKERHUB_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKERHUB_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('MATTERMOST_WEBHOOK_URL') {
          value: "********",
        },
        orgs.newRepoSecret('NPM_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_USERNAME') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('che-dockerfiles') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      default_branch: "master",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('che-docs') {
      allow_rebase_merge: false,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "go",
        "javascript",
        "javascript-typescript",
        "python",
        "typescript"
      ],
      code_scanning_default_setup_enabled: true,
      dependabot_security_updates_enabled: true,
      description: "Official Eclipse Che Documentation",
      has_issues: false,
      has_wiki: false,
      homepage: "https://www.eclipse.org/che/docs/",
      topics+: [
        "antora",
        "asciidoc",
        "cde",
        "cloud",
        "cloud-ide",
        "containers",
        "devtools",
        "documentation",
        "eclipse",
        "ide",
        "kubernetes",
        "modular-docs",
        "modular-documentation"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://ci.codenvycorp.com/github-webhook/') {
          events+: [
            "push"
          ],
        },
        orgs.newRepoWebhook('https://ci.codenvycorp.com/ghprbhook/') {
          events+: [
            "issue_comment",
            "pull_request",
            "push"
          ],
        },
        orgs.newRepoWebhook('https://ci.centos.org/github-webhook/') {
          content_type: "json",
          events+: [
            "push"
          ],
        },
        orgs.newRepoWebhook('https://ci.centos.org/ghprbhook/') {
          content_type: "json",
          events+: [
            "issue_comment",
            "pull_request"
          ],
        },
      ],
      secrets: [
        orgs.newRepoSecret('CHE_BOT_GITHUB_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('MATTERMOST_WEBHOOK_URL') {
          value: "********",
        },
        orgs.newRepoSecret('NETLIFY_AUTH_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('NETLIFY_SITE_ID') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_USERNAME') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          required_status_checks+: [
            "Build and validate pull request"
          ],
          requires_code_owner_reviews: true,
        },
      ],
    },
    orgs.newRepo('che-docs-vale-style') {
      allow_merge_commit: true,
      allow_update_branch: false,
      description: "Vale style for Eclipse Che Documentation and related projects",
      has_wiki: false,
      homepage: "",
      topics+: [
        "eclipse-che",
        "vale",
        "vale-style"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('che-editor-gwt-ide') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://ci.codenvycorp.com/github-webhook/') {
          events+: [
            "push"
          ],
        },
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
    },
    orgs.newRepo('che-go-jsonrpc') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
    },
    orgs.newRepo('che-jwtproxy') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      dependabot_security_updates_enabled: true,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
        orgs.newRepoWebhook('https://ci.centos.org/github-webhook/') {
          events+: [
            "pull_request",
            "push"
          ],
        },
        orgs.newRepoWebhook('https://smee.io/pRtJXvHGV9e8Zth') {
          content_type: "json",
          events+: [
            "push"
          ],
        },
      ],
      secrets: [
        orgs.newRepoSecret('DOCKERHUB_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKERHUB_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKER_IMAGE') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKER_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKER_REPO') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKER_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('MATTERMOST_WEBHOOK_URL') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_USERNAME') {
          value: "********",
        },
      ],
    },
    orgs.newRepo('che-lib') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      description: "Che Libraries",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://ci.codenvycorp.com/ghprbhook/') {
          events+: [
            "issue_comment",
            "pull_request",
            "push"
          ],
        },
        orgs.newRepoWebhook('https://ci.codenvycorp.com/github-webhook/') {
          events+: [
            "push"
          ],
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('che-ls-jdt') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      description: "che-ls-jdt",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://ci.eclipse.org/che/github-webhook/') {
          events+: [
            "push"
          ],
        },
      ],
    },
    orgs.newRepo('che-machine-exec') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "go",
        "javascript",
        "javascript-typescript",
        "typescript"
      ],
      code_scanning_default_setup_enabled: true,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://ci.centos.org/github-webhook/') {
          events+: [
            "push"
          ],
        },
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
        orgs.newRepoWebhook('https://ci.centos.org/ghprbhook/') {
          events+: [
            "issue_comment",
            "pull_request",
            "push"
          ],
        },
        orgs.newRepoWebhook('https://smee.io/pRtJXvHGV9e8Zth') {
          content_type: "json",
          events+: [
            "push"
          ],
        },
      ],
      secrets: [
        orgs.newRepoSecret('CHE_BOT_GITHUB_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('CHE_INCUBATOR_BOT_GITHUB_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('CODECOV_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKERHUB_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKERHUB_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('MATTERMOST_WEBHOOK_URL') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('TRAVIS_TOKEN') {
          value: "********",
        },
      ],
    },
    orgs.newRepo('che-operator') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "go"
      ],
      code_scanning_default_setup_enabled: true,
      dependabot_security_updates_enabled: true,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://ci.centos.org/github-webhook/') {
          events+: [
            "push"
          ],
        },
        orgs.newRepoWebhook('https://ci.centos.org/ghprbhook/') {
          events+: [
            "issue_comment",
            "pull_request",
            "push"
          ],
        },
        orgs.newRepoWebhook('https://hook-ci.apps.ci.l2s4.p1.openshiftapps.com/hook') {
          content_type: "json",
          events+: [
            "*"
          ],
          secret: "********",
        },
        orgs.newRepoWebhook('https://smee.io/pRtJXvHGV9e8Zth') {
          content_type: "json",
          events+: [
            "push"
          ],
        },
      ],
      secrets: [
        orgs.newRepoSecret('CHE_BOT_GITHUB_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('CHE_INCUBATOR_BOT_GITHUB_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('CODECOV_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKERHUB_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKERHUB_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('MATTERMOST_WEBHOOK_URL') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_ECLIPSE_CHE_OPERATOR_KUBERNETES_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_ECLIPSE_CHE_OPERATOR_KUBERNETES_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_ECLIPSE_CHE_OPERATOR_OPENSHIFT_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_ECLIPSE_CHE_OPERATOR_OPENSHIFT_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_ECLIPSE_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_ECLIPSE_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_USERNAME') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: null,
          required_status_checks+: [
            "any:WIP"
          ],
          requires_pull_request: false,
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('che-parent') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      description: "Che project repository",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://ci.codenvycorp.com/github-webhook/') {
          events+: [
            "push"
          ],
        },
        orgs.newRepoWebhook('https://ci.codenvycorp.com/ghprbhook/') {
          events+: [
            "issue_comment",
            "pull_request",
            "push"
          ],
        },
        orgs.newRepoWebhook('https://ci.centos.org/github-webhook/') {
          content_type: "json",
          events+: [
            "push"
          ],
        },
        orgs.newRepoWebhook('https://ci.centos.org/ghprbhook/') {
          content_type: "json",
          events+: [
            "issue_comment",
            "pull_request"
          ],
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('che-plugin-broker') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      has_issues: false,
      has_projects: false,
      has_wiki: false,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://ci.centos.org/github-webhook/') {
          events+: [
            "push"
          ],
        },
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
        orgs.newRepoWebhook('https://circleci.com/hooks/github') {
          events+: [
            "commit_comment",
            "create",
            "delete",
            "fork",
            "gollum",
            "issue_comment",
            "issues",
            "member",
            "public",
            "pull_request",
            "pull_request_review_comment",
            "push",
            "release",
            "status",
            "team_add",
            "watch"
          ],
          secret: "********",
        },
        orgs.newRepoWebhook('https://ci.centos.org/ghprbhook/') {
          content_type: "json",
          events+: [
            "issue_comment",
            "pull_request"
          ],
        },
        orgs.newRepoWebhook('https://smee.io/pRtJXvHGV9e8Zth') {
          content_type: "json",
          events+: [
            "push"
          ],
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('master') {
          required_approving_review_count: 1,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('che-plugin-registry') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "javascript",
        "javascript-typescript",
        "typescript"
      ],
      code_scanning_default_setup_enabled: true,
      dependabot_security_updates_enabled: true,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://ci.centos.org/github-webhook/') {
          events+: [
            "push"
          ],
        },
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
        orgs.newRepoWebhook('https://ci.centos.org/ghprbhook/') {
          events+: [
            "issue_comment",
            "pull_request",
            "push"
          ],
        },
        orgs.newRepoWebhook('https://hook.ci.openshift.org/hook') {
          content_type: "json",
          events+: [
            "*"
          ],
          secret: "********",
        },
      ],
      secrets: [
        orgs.newRepoSecret('CHE_BOT_GITHUB_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKERHUB_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKERHUB_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('MATTERMOST_WEBHOOK_URL') {
          value: "********",
        },
        orgs.newRepoSecret('NPM_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('SURGE_TOKEN') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: null,
          requires_pull_request: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('che-plugin-svn') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Che SVN plugin",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('che-release') {
      allow_merge_commit: true,
      allow_update_branch: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse Che release orchestration scripts and tools",
      homepage: "",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://ci.centos.org/github-webhook/') {
          events+: [
            "push"
          ],
        },
        orgs.newRepoWebhook('https://ci.centos.org/ghprbhook/') {
          events+: [
            "issue_comment",
            "pull_request",
            "push"
          ],
        },
      ],
      secrets: [
        orgs.newRepoSecret('AKAMAI_CHE_AUTH') {
          value: "********",
        },
        orgs.newRepoSecret('CHE_BOT_GITHUB_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('CHE_GITHUB_SSH_KEY') {
          value: "********",
        },
        orgs.newRepoSecret('CHE_INCUBATOR_BOT_GITHUB_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('CHE_MAVEN_SETTINGS') {
          value: "********",
        },
        orgs.newRepoSecret('CHE_NPM_AUTH_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('CHE_OSS_SONATYPE_GPG_KEY') {
          value: "********",
        },
        orgs.newRepoSecret('CHE_OSS_SONATYPE_PASSPHRASE') {
          value: "********",
        },
        orgs.newRepoSecret('CRW_BUILD_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('CRW_BUILD_USER') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKERHUB_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKERHUB_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('MATTERMOST_WEBHOOK_URL') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_ECLIPSE_CHE_OPERATOR_KUBERNETES_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_ECLIPSE_CHE_OPERATOR_KUBERNETES_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_ECLIPSE_CHE_OPERATOR_OPENSHIFT_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_ECLIPSE_CHE_OPERATOR_OPENSHIFT_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_ECLIPSE_CHE_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_ECLIPSE_CHE_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('RH_CHE_AUTOMATION_DOCKERHUB_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('RH_CHE_AUTOMATION_DOCKERHUB_USERNAME') {
          value: "********",
        },
      ],
    },
    orgs.newRepo('che-server') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "java-kotlin",
        "javascript",
        "javascript-typescript",
        "typescript"
      ],
      code_scanning_default_setup_enabled: true,
      has_issues: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://smee.io/pRtJXvHGV9e8Zth') {
          content_type: "json",
          events+: [
            "issue_comment",
            "pull_request",
            "push"
          ],
        },
      ],
      secrets: [
        orgs.newRepoSecret('CHE_BOT_GITHUB_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('CHE_GITHUB_SSH_KEY') {
          value: "********",
        },
        orgs.newRepoSecret('CHE_MAVEN_SETTINGS') {
          value: "********",
        },
        orgs.newRepoSecret('CHE_NPM_AUTH_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKERHUB_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKERHUB_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('MATTERMOST_WEBHOOK_URL') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('SONAR_TOKEN') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          required_status_checks+: [
            "any:build"
          ],
        },
      ],
    },
    orgs.newRepo('che-tests') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      delete_branch_on_merge: false,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('che-theia') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      dependabot_security_updates_enabled: true,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
        orgs.newRepoWebhook('https://smee.io/pRtJXvHGV9e8Zth') {
          content_type: "json",
          events+: [
            "issue_comment",
            "pull_request",
            "push"
          ],
        },
      ],
      secrets: [
        orgs.newRepoSecret('AKAMAI_CHE_AUTH') {
          value: "********",
        },
        orgs.newRepoSecret('CHE_BOT_GITHUB_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('CHE_NPM_AUTH_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKERHUB_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKERHUB_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('MATTERMOST_WEBHOOK_URL') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_ECLIPSE_CHE_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_ECLIPSE_CHE_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('TRAVIS_TOKEN') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          required_status_checks+: [
            "any:docker-build (alpine)",
            "any:docker-build (ubi8)",
            "any:node-build"
          ],
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
    orgs.newRepo('che-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "javascript",
        "javascript-typescript",
        "typescript"
      ],
      code_scanning_default_setup_enabled: true,
      dependabot_security_updates_enabled: true,
      description: "Official Eclipse Che Website",
      homepage: "https://www.eclipse.org/che",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('WEBSITE_TOKEN') {
          value: "********",
        },
      ],
    },
    orgs.newRepo('che-website-publish') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('che-workspace-client') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "javascript",
        "javascript-typescript",
        "typescript"
      ],
      code_scanning_default_setup_enabled: true,
      dependabot_security_updates_enabled: true,
      description: "che-workspace-client",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
      secrets: [
        orgs.newRepoSecret('NPM_TOKEN') {
          value: "********",
        },
      ],
    },
    orgs.newRepo('che-workspace-loader') {
      allow_merge_commit: true,
      allow_update_branch: false,
      archived: true,
      default_branch: "master",
      dependabot_security_updates_enabled: true,
      has_issues: false,
      secret_scanning_push_protection: "disabled",
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://ci.centos.org/github-webhook/') {
          events+: [
            "create",
            "delete",
            "pull_request",
            "push"
          ],
        },
      ],
      secrets: [
        orgs.newRepoSecret('DOCKERHUB_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKERHUB_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('MATTERMOST_WEBHOOK_URL') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_PASSWORD') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_USERNAME') {
          value: "********",
        },
      ],
    },
  ],
}
