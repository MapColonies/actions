# ⚙️ MapColonies Actions

This repository contains GitHub Actions used across the MapColonies organization, developed and maintained by the **DevOps team**.

> 🧪 The workflows in this repo are for testing and validating the functionality of the actions — **not for general use** in other projects.

---

## 📂 Structure

```
.
├── actions/                # Reusable composite actions
│   ├── artifactory-login/
│   ├── build-and-push-docker/
│   ├── build-and-push-helm/
│   ├── helm-lint/
│   ├── npm-publish/
│   └── update-artifacts-file/
├── test/                   # Assets for testing the actions
├── .github/workflows/      # Test workflows for each action
├── release-please-config.json
└── README.md
```

Each action has a dedicated folder with:
- `action.yaml` – definition of the action
- `README.md` – usage and inputs specific to the action

---

## 🧪 Purpose of This Repo

- Maintain reusable actions for use in other repositories
- Create test workflows to verify action behavior before tagging
- Manage action versioning and changelogs via `release-please`

---

## 📦 Actions Included

| Action | Description |
|--------|-------------|
| `artifactory-login`       | Logs in to Azure Container Registry |
| `build-and-push-docker`   | Builds and pushes Docker images |
| `build-and-push-helm`     | Packages and publishes Helm charts |
| `helm-lint`               | Lints and tests Helm charts |
| `npm-publish`             | Publishes npm packages |
| `update-artifacts-file`   | Updates `artifacts.json` metadata |

---

## 📝 Notes

- Each action has its own `README.md` for documentation.
- Versioning and changelog management are handled by `release-please`.
- Tags follow semver (`v1.1.0`, `v1.1`, `v1`).
