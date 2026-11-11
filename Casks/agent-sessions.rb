cask "agent-sessions" do
  arch arm: "arm64", intel: "x64"

  version "0.1.9"
  sha256 arm:   "f2c61f262e27cbb8c3b96e9e3ddd2ff95ac260a167725274edc3a9e7b7514ab8",
         intel: "51b048399153f09eb17fe1f848bd4a28d62a9d16924c87b2ca6af77ef4718192"

  url "https://github.com/karlhsueh/agent-sessions/releases/download/v#{version}/agent-sessions-mac-#{arch}.dmg"
  name "Agent Sessions"
  desc "Move Claude Code and Codex sessions between computers"
  homepage "https://karlhsueh.github.io/agent-sessions/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "Agent Sessions.app"

  zap trash: [
    "~/Library/Application Support/agent-sessions",
    "~/Library/Caches/agent-sessions-updater",
    "~/Library/Preferences/com.karlhsueh.agent-sessions.plist",
    "~/Library/Saved Application State/com.karlhsueh.agent-sessions.savedState",
  ]
end
