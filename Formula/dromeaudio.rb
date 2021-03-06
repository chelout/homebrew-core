class Dromeaudio < Formula
  desc "Small C++ audio manipulation and playback library"
  homepage "https://github.com/joshb/dromeaudio/"
  url "https://github.com/joshb/DromeAudio/archive/v0.3.0.tar.gz"
  sha256 "d226fa3f16d8a41aeea2d0a32178ca15519aebfa109bc6eee36669fa7f7c6b83"
  head "https://github.com/joshb/dromeaudio.git"

  bottle do
    cellar :any_skip_relocation
    rebuild 2
    sha256 "5199ecfbb8454f1560685c537b1fbaf1b301b39ad8ea825a9f846cc9f3530f30" => :catalina
    sha256 "062b0fa8e43363d60e5816343d1fcb7f58ce02c236512d96f4bf4ba10c96fd2c" => :mojave
    sha256 "1334685c021a520567e2d16bfe68ebddea8f9382a50645e241d09349cfb6b450" => :high_sierra
  end

  depends_on "cmake" => :build

  def install
    # install FindDromeAudio.cmake under share/cmake/Modules/
    inreplace "share/CMakeLists.txt", "${CMAKE_ROOT}", "#{share}/cmake"
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "#{bin}/DromeAudioPlayer", test_fixtures("test.mp3")
  end
end
