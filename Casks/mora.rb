cask "mora" do
  arch arm: "arm64", intel: "amd64"

  version "0.2.0"

  on_arm do
    sha256 "9bf6fec0507d8d056b23d7744ff2433194f542521cac61dcdb45c8ab17000e5d"
  end
  on_intel do
    sha256 "5c9555d3c13c964ed9c80f14bd13142e17a50b5f1ef5c7ac7753e990483a01cf"
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
