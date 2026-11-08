class Msd < Formula
  desc "Command-line tool for Mac Sequence Diagram"
  homepage "https://macsequencediagram.com"
  url "https://github.com/mabidakun/homebrew-tap/releases/download/v26.11.02/msd-26.11.02-macos.tar.gz"
  sha256 "42607c44ec599d7adc554c5467fdebf1a6a15f19a84b38f3d994da906cf95fbf"
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
