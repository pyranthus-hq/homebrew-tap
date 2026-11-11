# typed: strict
# frozen_string_literal: true

cask "mora" do
  arch arm: "arm64", intel: "amd64"

  version "0.17.0"
  sha256 arm:   "a1b73361d7da06ee5037c5e8abd6bdffdaf3564d798cc8b9ebc959a31bf5f846",
         intel: "3f1a1edd8b0d7881f62d4a674272a52cbe8845bd60e444558e7cfff68c7d43a7"

  url "https://github.com/pyranthus-hq/mora/releases/download/v#{version}/mora_#{version}_darwin_#{arch}_app.zip"
  name "Mora"
  desc "Local-first, agent-agnostic memory CLI"
  homepage "https://github.com/pyranthus-hq/mora"

  depends_on :macos

  app "Mora.app"
  binary "#{appdir}/Mora.app/Contents/MacOS/mora", target: "mora"

  # Third-party tap: literal preflight_steps cannot check a conflicting user app.
  preflight do
    user_app = Pathname(Dir.home)/"Applications/Mora.app"
    if user_app.exist?
      odie "Mora.app already exists at #{user_app}. " \
           "Remove it with Mora's signed-app uninstaller before installing the Homebrew Cask."
    end
  end

  caveats <<~EOS
    This installs the signed memory CLI app and the mora command, not the desktop companion.
    For automatic updates, run mora upgrade --policy auto, then mora schedule install update-daily.
    Installation does not enable a schedule or configure connectors.
    Mora preserves its vault, configuration, state, connector tokens, and backups on uninstall.
    If another Mora.app, standalone mora binary, symlink, formula, or legacy Cask is installed,
    remove that installation explicitly before retrying. This Cask never uses --adopt.
  EOS
end
