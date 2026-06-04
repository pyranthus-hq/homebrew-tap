cask "mora" do
  arch arm: "arm64", intel: "amd64"

  version "0.4.0"

  on_arm do
    sha256 "4fd30cc13e2dc67cc5eacbd433c4bb4a1efd2287be8ef986b9e1c2632ae678e4"
  end
  on_intel do
    sha256 "b1ab6916372dbff19cb8383c5fd32f518c60b7574d21798bd951d16622134bcb"
  end

  url "https://github.com/pyranthus-hq/mora/releases/download/v#{version}/mora_#{version}_darwin_#{arch}.tar.gz"
  name "mora"
  desc "Local-first, agent-agnostic memory CLI"
  homepage "https://github.com/pyranthus-hq/mora"

  binary "mora"

  # The binary is unsigned; strip the Gatekeeper quarantine xattr on install so
  # `mora` opens cleanly instead of "cannot be opened because Apple cannot check it".
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/mora"]
  end
end
