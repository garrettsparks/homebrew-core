class Librsync < Formula
  desc "Library that implements the rsync remote-delta algorithm"
  homepage "https://librsync.github.io/"
  url "https://github.com/librsync/librsync/archive/v2.3.4.tar.gz"
  sha256 "a0dedf9fff66d8e29e7c25d23c1f42beda2089fb4eac1b36e6acd8a29edfbd1f"
  license "LGPL-2.1-or-later"

  bottle do
    sha256 cellar: :any,                 arm64_ventura:  "ecf222fd327da97f55371c9c790dd373a4ff7c5db9ad8d3d94a18235c77cd7dd"
    sha256 cellar: :any,                 arm64_monterey: "e2062c102af08ddda0befc3c942256fc1e9135c1f3a5ace59cb89033b2fd430b"
    sha256 cellar: :any,                 arm64_big_sur:  "d8eacef1d3062a140f915d3f864f1ed2764175739658fbe7f39d5a316df4aa1e"
    sha256 cellar: :any,                 ventura:        "56a8016cd9f57fd16a18dc4718af15fa033220894bda2dab1eeb03583982635a"
    sha256 cellar: :any,                 monterey:       "0b1430ccb90548e554ae9b56990bfe958c416dac61594185b2ac0d38af89bb2d"
    sha256 cellar: :any,                 big_sur:        "1f060456ddd3143afd9d7b4ce09fa73de0b685d16e5b5add2eec4039175879d1"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "9c48743c4c502118826bf142d7bb393099a994c882b55c1c11430c656382af16"
  end

  depends_on "cmake" => :build
  depends_on "popt"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
    man1.install "doc/rdiff.1"
    man3.install "doc/librsync.3"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rdiff -V")
  end
end
