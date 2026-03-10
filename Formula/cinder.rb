class Cinder < Formula
  desc "Terminal music visualizer for macOS"
  homepage "https://github.com/moKshagna-p/cinder"
  url "https://github.com/moKshagna-p/cinder/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"

  depends_on "go" => :build
  depends_on :macos

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"cinder", "."
  end

  def caveats
    <<~EOS
      cinder works out of the box with no extra setup.

      Optional enhancements:
        - For real-time audio reactivity, install ffmpeg:
            brew install ffmpeg
          Then set the environment variable when running:
            CINDER_AUDIO_REACTIVE=1 cinder

        - For richer now-playing metadata (preferred over AppleScript):
            brew install nowplaying-cli
    EOS
  end

  test do
    assert_match "cinder", shell_output("#{bin}/cinder --help 2>&1", 1)
  end
end
