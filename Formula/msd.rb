class Msd < Formula
  desc "Command-line tool for Mac Sequence Diagram"
  homepage "https://macsequencediagram.com"
  url "https://github.com/mabidakun/homebrew-tap/releases/download/v26.10.01/msd-26.10.01-macos.tar.gz"
  sha256 "a2e84b40b26e6701adccafdcce3561f51dafb8a0ca87f5189050c289a78fad7f"
  license :cannot_represent

  depends_on macos: :sonoma

  def install
    bin.install "msd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/msd --version")
    (testpath/"hello.msd").write "Alice -> Bob: Hello\n"
    system bin/"msd", "check", testpath/"hello.msd"
  end
end
