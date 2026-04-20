# Command: fix-issue

## Description
Given an issue number or description, diagnose and fix the bug.

## Steps
1. Read the issue description carefully
2. Reproduce the bug locally
3. Identify the root cause (use the Debugger agent)
4. Write a failing test that captures the bug
5. Fix the code until the test passes
6. Ensure no existing tests regressed
7. Commit with message: `fix: <short description> (closes #<issue>)`

## Usage
```
/fix-issue #123
/fix-issue "users can't log in after password reset"
```
