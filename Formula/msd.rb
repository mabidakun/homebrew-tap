class Msd < Formula
  desc "Command-line tool for Mac Sequence Diagram"
  homepage "https://macsequencediagram.com"
  url "https://github.com/mabidakun/homebrew-tap/releases/download/v26.10.01/msd-26.10.01-macos.tar.gz"
  sha256 "fb2af8fabaabb3b5fc40bb920ef2cd53279411a35a3df403cde42f9b0a7870f5"
  license :cannot_represent

  depends_on arch: :arm64
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
