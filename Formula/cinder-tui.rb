class CinderTui < Formula
  desc "Terminal music visualizer for macOS"
  homepage "https://github.com/moKshagna-p/cinder"
  version "1.0.2"
  license "MIT"

  depends_on :macos
  depends_on "ffmpeg"

  on_arm do
    url "https://github.com/moKshagna-p/cinder/releases/download/v#{version}/cinder_Darwin_arm64.tar.gz"
    sha256 "104686be4fc978d0eacd1f39ed01607b4b597973a758bbc486a56135efad6313"
  end

  on_intel do
    url "https://github.com/moKshagna-p/cinder/releases/download/v#{version}/cinder_Darwin_x86_64.tar.gz"
    sha256 "142f992559e7bd47361ac00c675629262553056e864245ebcf55fc602bdf0654"
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
