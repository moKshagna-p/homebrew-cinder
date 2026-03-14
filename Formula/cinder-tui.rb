class CinderTui < Formula
  desc "Terminal music visualizer for macOS"
  homepage "https://github.com/moKshagna-p/cinder"
  version "1.0.1"
  license "MIT"

  depends_on :macos
  depends_on "ffmpeg"

  on_arm do
    url "https://github.com/moKshagna-p/cinder/releases/download/v#{version}/cinder_Darwin_arm64.tar.gz"
    sha256 "4fc1e3ef40e29889f6e52ae99cf44e16416dee32483f6b426ac05ccd6d444a2d"
  end

  on_intel do
    url "https://github.com/moKshagna-p/cinder/releases/download/v#{version}/cinder_Darwin_x86_64.tar.gz"
    sha256 "d714dd9541dcad65052bb7fb15bf95f91706af95abb577ab01bd5dcb30239699"
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
