class CinderTui < Formula
  desc "Terminal music visualizer for macOS"
  homepage "https://github.com/moKshagna-p/cinder"
  version "1.0.3"
  license "MIT"

  depends_on :macos
  depends_on "ffmpeg"

  on_arm do
    url "https://github.com/moKshagna-p/cinder/releases/download/v#{version}/cinder_Darwin_arm64.tar.gz"
    sha256 "6d03139a9983b50099af1ec784a65f01908a36856c30ccbb2c27b608ae86079c"
  end

  on_intel do
    url "https://github.com/moKshagna-p/cinder/releases/download/v#{version}/cinder_Darwin_x86_64.tar.gz"
    sha256 "961653ca60ad628398d5aba9a39c207cdaeb22da61b10615cd80d486838c70ea"
  end

  def install
    bin.install "cinder"
  end

  def caveats
    <<~EOS
      cinder works out of the box with no extra setup.

      For audio-reactive system-output visualization:
        1. Install BlackHole 2ch:
             brew install --cask blackhole-2ch
        2. Run:
             cinder --setup-audio
        3. After the one-time setup, just run:
             cinder

      Optional enhancement:
        - For richer now-playing metadata (preferred over AppleScript):
            brew install nowplaying-cli
    EOS
  end

  test do
    assert_predicate bin/"cinder", :exist?
  end
end
