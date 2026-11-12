@test "accepts feature branch"         { run actions/branch-name/check.sh "feat/42-tui-search"; [ "$status" -eq 0 ]; }
@test "accepts maintenance branch"     { run actions/branch-name/check.sh "release/1.x"; [ "$status" -eq 0 ]; }
@test "accepts dependabot"             { run actions/branch-name/check.sh "dependabot/pip/ruff-0.8.0"; [ "$status" -eq 0 ]; }
@test "accepts release-please"         { run actions/branch-name/check.sh "release-please--branches--main"; [ "$status" -eq 0 ]; }
@test "accepts main"                   { run actions/branch-name/check.sh "main"; [ "$status" -eq 0 ]; }
@test "rejects missing issue number"   { run actions/branch-name/check.sh "feat/tui-search"; [ "$status" -eq 1 ]; }
@test "rejects unknown type"           { run actions/branch-name/check.sh "feature/42-x"; [ "$status" -eq 1 ]; }
@test "rejects uppercase"              { run actions/branch-name/check.sh "fix/7-Crash"; [ "$status" -eq 1 ]; }
