# Command: pr-review

## Description
Review a pull request using the Code Reviewer and Security Auditor agents.

## Steps
1. Fetch the PR diff
2. Run Code Reviewer checklist on changed files
3. Run Security Auditor checklist on changed files
4. Summarize findings grouped by severity
5. Provide a final LGTM or Needs Changes verdict

## Usage
```
/pr-review #42
/pr-review https://github.com/org/repo/pull/42
```

## Output Format
### Summary
[One paragraph overview]

### Issues
- 🔴 Critical: ...
- 🟡 Warning: ...
- 💡 Suggestion: ...

### Verdict
[ ] LGTM  [ ] Needs Changes
