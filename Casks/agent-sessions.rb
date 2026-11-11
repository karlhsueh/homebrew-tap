cask "agent-sessions" do
  arch arm: "arm64", intel: "x64"

  version "0.1.10"
  sha256 arm:   "c5d7b381560c3491750c2a6f40e3ce88841ce155cbac1fe47f11592b32a40a0d",
         intel: "d5a5aa4f931d5f33492de91c9695aec12bd46fa325470e64a53b1efe1b5eedb5"

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
