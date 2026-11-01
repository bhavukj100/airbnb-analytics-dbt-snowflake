# VS Code Configuration Decisions

| Decision | Rationale |
|---|---|
| Use workspace settings in `.vscode/settings.json` | The request was for this project, so the behavior is scoped to this workspace rather than changing the VS Code profile for every project. |
| Enable `editor.inlineSuggest.enabled` | Displays inline completion suggestions as code is typed. |
| Enable `github.copilot.enable` globally and for `sql` and `jinja-sql` | Keeps Copilot available generally and explicitly enables it for the SQL language modes used by this dbt workspace. |
| Keep the existing `*.sql` → `jinja-sql` association | dbt SQL files can contain Jinja templates, so preserving this association lets VS Code apply the workspace’s Jinja-SQL language settings. |
| Set `editor.formatOnSave` to `true` globally and for `sql` and `jinja-sql` | Formats supported documents when saved, including SQL files regardless of whether VS Code identifies them as plain SQL or Jinja-SQL. |
| Do not install or choose a formatter automatically | Formatter choice depends on the extensions available and the desired SQL style. Format-on-save takes effect only when a compatible formatter is installed and selected. |

These settings enable the requested behavior but cannot guarantee that inline suggestions appear or documents are formatted: Copilot must be installed and signed in, and a compatible formatter must be available.
