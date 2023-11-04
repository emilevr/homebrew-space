class Space < Formula
  desc "Analyze and clean your disk space (powered by Rust)"
  homepage "https://github.com/emilevr/space"
  url "https://github.com/emilevr/space/archive/refs/tags/0.1.6.tar.gz"
  sha256 "df839731ffd6904df06c347e56f5b6052cbe0f42a0746939bcf93da90f702531"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/emilevr/homebrew-space/releases/download/space-0.1.6"
    sha256 cellar: :any_skip_relocation, ventura:      "7b8b5abda1485437e74899fbc1201ce90c1f4e02d91c3fb7b0d4db6ca87e8f95"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2b1fded1caa38dba91321e20cf301b9e8aebd0790d916b144fcbea4a6c5bdbc5"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Space, the final frontier!", shell_output("#{bin}/space --help")
  end
end
