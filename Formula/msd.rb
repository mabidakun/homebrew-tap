class Msd < Formula
  desc "Command-line tool for Mac Sequence Diagram"
  homepage "https://macsequencediagram.com"
  url "https://github.com/mabidakun/homebrew-tap/releases/download/v26.11.01/msd-26.11.01-macos.tar.gz"
  sha256 "07e3852302df3c1941a035f94d7feab0b5edd42f7b77bd1f9a962de467d66a4b"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    bin.install "msd"
    prefix.install "LICENSE"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/msd --version")
    (testpath/"hello.msd").write "Alice -> Bob: Hello\n"
    system bin/"msd", "check", testpath/"hello.msd"
  end
end
