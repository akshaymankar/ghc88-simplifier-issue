# ghc88-simplifier-issue

This repository demonstrates an issue with GHC where the simplifier runs out of
ticks while compiling a simple function. The bug happens with GHC 8.8 and GHC
8.10. GHC 8.6.5 is able to compile this without any problems.

## The error

```
Simplifier ticks exhausted
  When trying UnfoldingDone w1_s1v5
  To increase the limit, use -fsimpl-tick-factor=N (default 100).

  If you need to increase the limit substantially, please file a
  bug report and indicate the factor you needed.

  If GHC was unable to complete compilation even with a very large factor
  (a thousand or more), please consult the "Known bugs or infelicities"
  section in the Users Guide before filing a report. There are a
  few situations unlikely to occur in practical programs for which
  simplifier non-termination has been judged acceptable.

  To see detailed counts use -ddump-simpl-stats
  Total ticks: 17534
```

## When run with -ddump-simpl-stats

Please refer to [ddump-simpl-stats](./ddump-simpl-stats).

## How to compile

### With GHC 8.10.2:

1. Start nix-shell
   ```
   nix-shell
   ```
2. Compile with cabal
   ```
   cabal build
   ```

### With other GHC versions:

1. Start nix-shell with `ghcVersion` set to desired version, for example 8.6.5:
   ```
   nix-shell --argstr ghcVersion 865
   ```
2. Compile with cabal
   ```
   cabal build
   ```
