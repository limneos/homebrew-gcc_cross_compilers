require 'formula'

class ArmElfBinutils < Formula
  homepage 'http://gcc.gnu.org'
  url 'http://ftp.gnu.org/gnu/binutils/binutils-2.27.tar.gz'
  sha256 '26253bf0f360ceeba1d9ab6965c57c6a48a01a8343382130d1ed47c468a3094f'

  depends_on 'gcc' => :build
  def install
    ENV['CC'] = '/usr/local/bin/gcc-7'
    ENV['CXX'] = '/usr/local/bin/g++-7'
    ENV['CPP'] = '/usr/local/bin/cpp-7'
    ENV['LD'] = '/usr/local/bin/gcc-7'

    mkdir 'build' do
      system '../configure', '--disable-nls', '--target=x86_64-elf','--disable-werror',
                             '--enable-gold=yes',
                             "--prefix=#{prefix}"
      system 'make all'
      system 'make install'
    end
  end
end
