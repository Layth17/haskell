# haskell

### Resources
- https://www.haskell.org/get-started/
- https://learnyouahaskell.github.io/chapters.html
- https://www.seas.upenn.edu/~cis1940/spring13/lectures.html (outdated)

### GHCup

- **GHC** (The Haskell compiler) We will use GHC below to run our examples, but in practice you will mostly use a tool like Cabal or Stack to build your code, instead of GHC directly.
- **HLS** (The Haskell Language Server) You won’t use HLS directly, instead your code editor will use it in the background to provide you with a great experience while editing Haskell code.
- **Cabal** (A Haskell build tool) You will use Cabal to structure your Haskell projects, build them, run them, define dependencies, … .
- **Stack** (A Haskell build tool) An alternative to Cabal.

- install command `curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh`
- installs in `C:\ghcup`
- my profile `"/c/Users/Layth/.bashrc` 
- cabal config `C:\Users\Layth\AppData\Roaming\cabal\config`
- load programs using `ghci <name>.hs` or from inside `ghci`, run `:l <program>`

```
All done!

In a new powershell or cmd.exe session, now you can...

Start a simple repl via:
  ghci

Start a new haskell project in the current directory via:
  cabal init --interactive

To install other GHC versions and tools, run:
  ghcup tui

To install system libraries and update msys2/mingw64,
open the "Mingw haskell shell"
and the "Mingw package management docs"
desktop shortcuts.

If you are new to Haskell, check out https://www.haskell.org/ghcup/steps/
```
