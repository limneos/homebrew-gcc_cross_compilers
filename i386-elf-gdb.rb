require 'formula'

class I386ElfGdb < Formula
  homepage 'http://gcc.gnu.org'
  url 'http://ftp.gnu.org/gnu/gdb/gdb-7.11.1.tar.xz'
  sha256 'e9216da4e3755e9f414c1aa0026b626251dfc57ffe572a266e98da4f6988fc70'

  depends_on 'i386-elf-binutils'
  depends_on 'i386-elf-gcc'

  def install
    ENV['CC'] = '/usr/local/bin/gcc-7'
    ENV['CXX'] = '/usr/local/bin/g++-7'
    ENV['CPP'] = '/usr/local/bin/g++-7'
    ENV['LD'] = '/usr/local/bin/gcc-7'

    mkdir 'build' do
      system '../configure', '--target=i386-elf', "--prefix=#{prefix}", "--disable-werror"
      system 'make'
      system 'make install'
      FileUtils.rm_rf share/"locale"
    end
  end
end
