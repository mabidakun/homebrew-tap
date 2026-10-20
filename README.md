# Homebrew tap for Mac Sequence Diagram

This tap provides `msd`, the command-line companion to [Mac Sequence Diagram](https://macsequencediagram.com). It checks, fixes and converts sequence diagrams written in the app's native syntax or in Mermaid, without opening the app.

## Installation

```sh
brew install mabidakun/tap/msd
```

`msd` is a universal binary (Apple silicon and Intel), signed and notarised, and requires macOS 14 (Sonoma) or later.

## Commands

- `msd check <file|->` lists every error and warning, in compiler style or as JSON with `--format json`. It exits 1 when there are errors.

  ```text
  diagram.msd:2:1: error: `Bob` isn't expected here
    The diagram can't make sense of this at this point. Check the line for a typo or a missing word.
  ```

  ```json
  {
    "diagnostics" : [
      {
        "code" : "unexpectedToken",
        "column" : 1,
        "line" : 2,
        "message" : "`Bob` isn't expected here",
        "severity" : "error"
      }
    ],
    "dialect" : "native",
    "file" : "diagram.msd",
    "valid" : false
  }
  ```

  (The JSON also carries `explanation`, `example`, `fix`, `length`, `offset` and `relatedLine`; trimmed here.)
- `msd fix <file|->` applies the safe automatic fixes, then reports what is left.
- `msd syntax` prints a Markdown syntax reference, native by default or Mermaid with `--dialect mermaid`.
- `msd convert <file|-> --to native|mermaid` converts a diagram between the two syntaxes.

Run `msd <command> --help` for the full options.

## Using with AI agents

`msd` gives an AI agent a way to write diagrams that are correct rather than guessed. The agent can learn the syntax from `msd syntax`, write a diagram, then loop `msd check --format json`, `msd fix` and a re-check until it is clean. Each diagnostic carries a line and column, an explanation and an example, so the agent can repair mistakes precisely.

A suggested snippet for a project's `CLAUDE.md` or `AGENTS.md`:

```markdown
## Sequence diagrams

Use the `msd` CLI (`brew install mabidakun/tap/msd`) when writing sequence diagrams.

1. Run `msd syntax` (or `msd syntax --dialect mermaid`) before writing a diagram.
2. After writing or editing one, run `msd check --format json <file>`.
3. Run `msd fix <file>`, then check again. Repeat until there are no errors.
```

More at [macsequencediagram.com](https://macsequencediagram.com).
