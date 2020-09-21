# Moove IT coding-challenge
# coded by: Lucas Ballestrino
# 20/09/2020
require 'socket'
class RubyMemcachedClient

  def initialize(ip,port)
     @ipdir = ip
     @port = port
     @socket = TCPSocket.new @ip , @port
  end

  def newconn(ip,port)
    @ipdir = ip
    @port = port
    @socket = TCPSocket.new @ip , @port
  end

#Storage commands
  # set <key> <flags> <exptime> <bytes> [noreply]\r\n
  # set store this data.
  def set (key,value,exptime="0",flags="0")
    msj = "set #{key} #{flags} #{exptime} #{value.length}\r\n#{value}\r\n"
    @socket.puts(msj)
    respuesta = @socket.gets.chomp
    return respuesta
  end

  #  add <key> <flags> <exptime> <bytes> [noreply]\r\n
  #  add store this data, but only if the server *doesn't* already hold data for this key.
  def add (key,value,exptime="0",flags="0")
    msj = "add #{key} #{flags} #{exptime} #{value.length}\r\n#{value}\r\n"
    @socket.puts(msj)
    respuesta = @socket.gets.chomp
    return respuesta
  end

  #  replace <key> <flags> <exptime> <bytes> [noreply]\r\n
  #  replace store this data, but only if the server *does* already hold data for this key.
  def replace (key,value,exptime="0",flags="0")
    msj = "replace #{key} #{flags} #{exptime} #{value.length}\r\n#{value}\r\n"
    @socket.puts(msj)
    respuesta = @socket.gets.chomp
    return respuesta
  end

  #  append <key> <bytes> [noreply]\r\n
  #  append add this data to an existing key after existing data.
  def append (key,value)
    msj = "append #{key} 0 0 #{value.length}\r\n#{value}\r\n"
    @socket.puts(msj)
    respuesta = @socket.gets.chomp
    return respuesta
  end

  #  prepend <key> <bytes> [noreply]\r\n
  #  prepend add this data to an existing key before existing data.
  def prepend (key,value)
    msj = "prepend #{key} 0 0 #{value.length}\r\n#{value}\r\n"
    @socket.puts(msj)
    respuesta = @socket.gets.chomp
    return respuesta
  end

  #cas <key> <flags> <exptime> <bytes> <cas unique> [noreply]\r\n
  #"cas" is a check and set operation which means "store this data but only if no one else has updated since I last fetched it."
  def cas (key,value,cas,exptime="0",flags="0")
    msj = "cas #{key} #{flags} #{exptime} #{value.length} #{cas}\r\n#{value}\r\n"
    @socket.puts(msj)
    respuesta = @socket.gets.chomp
    return respuesta
  end
#Storage commands

#Retrieval commands
  def get(key)
    arrayKey = key.split(" ")
    retorno = {}
    respuesta = ""
    stringValor = ""
    respuestaBuffer = ""
    arrayKey.each do | n |
      stringValor=""
      @socket.puts("get #{n}")
      respuestaBuffer = ""
      respuesta = ""
      while respuestaBuffer.chomp != "END"
        respuestaBuffer = @socket.gets
        if respuestaBuffer.chomp != "END"
        respuesta << respuestaBuffer
        end
      end
      respuestaArray = respuesta.split(" ")
      respuestaArray.each_with_index do |m,i|
        if i < 4
          respuesta.slice! m
          #stringValor << "#{respuestaArray[i]} "
        end
      end
        retorno.store(respuestaArray[1],respuesta.strip)
    end
    return retorno
  end

  def gets(key)
    arrayKey = key.split(" ")
    retorno = {}
    respuesta = ""
    stringValor = ""
    respuestaBuffer = ""
    arrayKey.each do | n |
      stringValor=""
      @socket.puts("gets #{n}")
      respuestaBuffer = ""
      respuesta = ""
      while respuestaBuffer.chomp != "END"
        respuestaBuffer = @socket.gets
        if respuestaBuffer.chomp != "END"
        respuesta << respuestaBuffer
        end
      end
      respuestaArray = respuesta.split(" ")
      respuestaArray.each_with_index do |m,i|
        if i < 2
          respuesta.slice! m
          #stringValor << "#{respuestaArray[i]} "
        end
      end
        retorno.store(respuestaArray[1],respuesta.strip)
    end
    return retorno
  end

#Retrieval commands

#Deletion
  def delete(key)
    @socket.puts("delete #{key}")
    respuesta = @socket.gets
    return respuesta
  end

  def flush(time="")
    @socket.puts("flush_all #{time}")
    respuesta = @socket.gets
    return respuesta
  end

#Deletion

#Increment/Decrement
  def incr(key,value)
    @socket.puts("incr #{key} #{value}")
    respuesta = @socket.gets
    return respuesta
  end

  def decr(key,value)
    @socket.puts("decr #{key} #{value}")
    respuesta = @socket.gets
    return respuesta
  end
#Increment/Decrement

#Touch
  def touch(key,exptime)
    @socket.puts("touch #{key} #{exptime}")
    respuesta = @socket.gets
    return respuesta
  end

  def gat(key,exptime)
    arrayKey = key.split(" ")
    retorno = {}
    respuesta = ""
    stringValor = ""
    respuestaBuffer = ""
    arrayKey.each do | n |
      stringValor=""
      @socket.puts("gat #{exptime} #{n}")
      respuestaBuffer = ""
      respuesta = ""
      while respuestaBuffer.chomp != "END"
        respuestaBuffer = @socket.gets
        if respuestaBuffer.chomp != "END"
        respuesta << respuestaBuffer
        end
      end
      respuestaArray = respuesta.split(" ")
      respuestaArray.each_with_index do |m,i|
        if i < 4
          respuesta.slice! m
          #stringValor << "#{respuestaArray[i]} "
        end
      end
        retorno.store(respuestaArray[1],respuesta.strip)
    end
    return retorno
  end

  def gats(key,exptime)
    arrayKey = key.split(" ")
    retorno = {}
    respuesta = ""
    stringValor = ""
    respuestaBuffer = ""
    arrayKey.each do | n |
      stringValor=""
      @socket.puts("gats #{exptime} #{n}")
      respuestaBuffer = ""
      respuesta = ""
      while respuestaBuffer.chomp != "END"
        respuestaBuffer = @socket.gets
        if respuestaBuffer.chomp != "END"
        respuesta << respuestaBuffer
        end
      end
      respuestaArray = respuesta.split(" ")
      respuestaArray.each_with_index do |m,i|
        if i < 2
          respuesta.slice! m
          #stringValor << "#{respuestaArray[i]} "
        end
      end
        retorno.store(respuestaArray[1],respuesta.strip)
    end
    return retorno
  end

#Touch

#Stats
  def stats(par="")
    @socket.puts("stats #{par}")
    respuestaBuffer=""
    respuesta = ""
    until respuestaBuffer.chomp == "END"
        respuestaBuffer = @socket.gets.chomp
        respuesta << "#{respuestaBuffer}\r\n"
    end
    return respuesta
  end
#Stats

  def closeconn
    @socket.close
  end
end
